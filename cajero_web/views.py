from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, "cajero_web/index.html")

def actualizar_nip(request):
    return render(request, "cajero_web/actualizar-nip.html")

def validar_cuenta(request):
    return render(request, "cajero_web/validar-cuenta.html")

def pago(request):
    return render(request, "cajero_web/pago.html")