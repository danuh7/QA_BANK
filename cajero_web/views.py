from django.shortcuts import render, get_object_or_404, redirect
from datetime import datetime
from django.core.exceptions import ObjectDoesNotExist
from .models import Operacion, Cuenta, TipoOperacion, FormaPago


# Create your views here.

def index(request):
    return render(request, "cajero_web/index.html")


def actualizar_nip(request):
    if request.POST:
        numero_cuenta = request.POST["txtCuenta"]
        nvo_nip = request.POST["txtNIP"]

        try:
            cuenta = Cuenta.objects.get(numero_cuenta=numero_cuenta)
            if nvo_nip == cuenta.nip:
                raise Exception("Tu nuevo nip no puede ser igual que el anterior.")

            cuenta.nip = nvo_nip
            cuenta.save()

            fecha_hora = datetime.now()
            operacion = Operacion(
                fecha=str(fecha_hora.date()),
                hora=str(fecha_hora.time())[:8],
                monto=0,
                id_origen=cuenta,
                id_tipo_operacion=TipoOperacion.objects.get(id_tipo=4)
            )
            operacion.save()
            return redirect('operacion-exitosa', operacion_id=operacion.id_operacion)
        except Exception as ex:
            return render(request, "cajero_web/actualizar-nip.html", {
                "error": str(ex)
            })
    else:
        return render(request, "cajero_web/actualizar-nip.html")


def validar_cuenta(request):
    next_page = request.GET.get('redirect')

    if request.POST:
        numero_cuenta = request.POST["txtCuenta"]
        nip = request.POST["txtNIP"]

        try:
            cuenta = Cuenta.objects.all().get(numero_cuenta=numero_cuenta)
            if nip == cuenta.nip:
                return redirect(next_page, cuenta_id=cuenta.id_cuenta)
            else:
                return render(request, "cajero_web/validar-cuenta.html", {
                    "error": "El NIP ingresado es incorrecto. Intente nuevamente"
                })
        except ObjectDoesNotExist:
            return render(request, "cajero_web/validar-cuenta.html", {
                "error": "El número de cuenta no existe o es incorrecto. Intente nuevamente."
            })
    else:
        return render(request, "cajero_web/validar-cuenta.html", {
            "next_page": '/' if next_page is None else next_page,
            "error": "Error: No hay punto de redirección" if next_page is None else None,
        })


def realizar_pago(request):
    formas_pago = FormaPago.objects.all()
    if request.POST:
        try:
            numero_referencia = request.POST["txtServicio"]
            monto = float(request.POST["txtMonto"])
            forma_pago = request.POST["sFormaPago"]
            print(forma_pago)

            if monto <= 0:
                raise Exception("El monto a pagar no puede ser menor o igual a cero.")

            destino = Cuenta.objects.get(numero_cuenta=numero_referencia)
            fecha_hora = datetime.now()
            operacion = Operacion(
                fecha=str(fecha_hora.date()),
                hora=str(fecha_hora.time())[:8],
                monto=monto,
                id_destino=destino,
                id_forma=FormaPago.objects.get(nombre=forma_pago),
                id_tipo_operacion=TipoOperacion.objects.get(id_tipo=6)
            )
            operacion.save()
            return redirect('operacion-exitosa', operacion_id=operacion.id_operacion)

        except ObjectDoesNotExist:
            return render(request, "cajero_web/realizar-pago.html", {
                "error": "El número de referencia no es válido",
                "formas_pago": formas_pago
            })
        except Exception as ex:
            return render(request, "cajero_web/realizar-pago.html", {
                "error": str(ex),
                "formas_pago": formas_pago
            })
    else:
        return render(request, "cajero_web/realizar-pago.html", {
            "formas_pago": formas_pago
        })


def operacion_exitosa(request, operacion_id):
    operacion = get_object_or_404(Operacion, pk=operacion_id)
    return render(request, "cajero_web/operacion-exitosa.html", {
        "fecha": operacion.fecha,
        "hora": operacion.hora,
        "monto": operacion.monto,
        "tipo_operacion": str(operacion.id_tipo_operacion),
        "cuenta_origen": str(operacion.id_origen),
        "cuenta_destino": str(operacion.id_destino),
    })


def consultar_saldo(request, cuenta_id):
    cuenta = get_object_or_404(Cuenta, pk=cuenta_id)
    saldo = cuenta.monto

    if request.POST:
        fecha_hora = datetime.now()
        operacion = Operacion(
            fecha=str(fecha_hora.date()),
            hora=str(fecha_hora.time())[:8],
            monto=saldo,
            id_origen=cuenta,
            id_tipo_operacion=TipoOperacion.objects.get(id_tipo=3)
        )
        operacion.save()
        return redirect('operacion-exitosa', operacion_id=operacion.id_operacion)
    else:
        return render(request, "cajero_web/consultar-saldo.html", {
            "saldo": saldo
        })


def retirar_saldo(request, cuenta_id):
    if request.POST:
        monto = float(request.POST["txtMonto"])
        try:
            if monto > 0:
                cuenta = get_object_or_404(Cuenta, pk=cuenta_id)
                if cuenta.monto >= monto:
                    fecha_hora = datetime.now()
                    operacion = Operacion(
                        fecha=str(fecha_hora.date()),
                        hora=str(fecha_hora.time())[:8],
                        monto=request.POST["txtMonto"],
                        id_origen=cuenta,
                        id_tipo_operacion=TipoOperacion.objects.get(id_tipo=2)
                    )
                    cuenta.monto -= monto
                    cuenta.save()
                    operacion.save()
                    print(Operacion.objects.all())
                    return redirect("operacion-exitosa", operacion_id=operacion.id_operacion)
                else:
                    raise Exception("No tienes saldo suficiente")
            else:
                raise Exception("El monto debe ser mayor a cero.")
        except Exception as ex:
            return render(request, "cajero_web/retirar-saldo.html", {
                "cuenta": cuenta_id,
                "error": str(ex)
            })
    else:
        return render(request, "cajero_web/retirar-saldo.html", {
            "cuenta": cuenta_id,
        })


def realizar_deposito(request):
    if request.POST:
        numero_cuenta = request.POST["txtCuenta"]
        monto = float(request.POST["txtMonto"])

        try:
            if monto <= 0:
                raise Exception("El monto no puede ser menor o igual a cero")

            cuenta = Cuenta.objects.get(numero_cuenta=numero_cuenta)
            fecha_hora = datetime.now()
            operacion = Operacion(
                fecha=str(fecha_hora.date()),
                hora=str(fecha_hora.time())[:8],
                monto=request.POST["txtMonto"],
                id_origen=cuenta,
                id_tipo_operacion=TipoOperacion.objects.get(id_tipo=5)
            )
            cuenta.monto += monto
            cuenta.save()
            operacion.save()
            print(Operacion.objects.all())
            return redirect("operacion-exitosa", operacion_id=operacion.id_operacion)
        except ObjectDoesNotExist:
            return render(request, "cajero_web/realizar-deposito.html", {
                "error": "El número de cuenta no es válido"
            })
        except Exception as ex:
            return render(request, "cajero_web/realizar-deposito.html", {
                "error": str(ex)
            })
    else:
        return render(request, "cajero_web/realizar-deposito.html")
