from django.shortcuts import render, get_object_or_404, redirect
from django.core.exceptions import ObjectDoesNotExist
from .models import Operacion, Cuenta


# Create your views here.

def index(request):
    return render(request, "cajero_web/index.html")


def actualizar_nip(request):
    return render(request, "cajero_web/actualizar-nip.html")


def validar_cuenta(request):
    next_page = request.GET.get('redirect')

    if request.POST:
        numero_cuenta = request.POST["txtCuenta"]
        nip = request.POST["txtNIP"]

        try:
            cuenta = Cuenta.objects.all().get(numero_cuenta=numero_cuenta)
            if nip == cuenta.nip:
                return redirect(next_page)
            else:
                return render(request, "cajero_web/validar-cuenta.html", {
                    "error": "El NIP ingresado es incorrecto. Intente nuevamente"
                })
        except ObjectDoesNotExist:
            return render(request, "cajero_web/validar-cuenta.html", {
                "error": "El número de cuenta no existe o es incorrecto. Intente nuevamente."
            })
    else:
        if next_page is None:
            next_page = ''

        return render(request, "cajero_web/validar-cuenta.html", {
            "next_page": next_page,
            "error": None
        })


def realizar_pago(request):
    return render(request, "cajero_web/realizar-pago.html")


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


def consultar_saldo(request):
    return render(request, "cajero_web/consultar-saldo.html")


def retirar_saldo(request):
    return render(request, "cajero_web/retirar-saldo.html")
