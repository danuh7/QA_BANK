from django.shortcuts import render

# Create your views here.


def index(request):
    return render(request, "cajero_web/index.html")

def actualizar_nip(request):
    return render(request, "cajero_web/actualizar-nip.html")