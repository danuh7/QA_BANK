from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name="index"),
    path('actualizar-nip', views.actualizar_nip, name="actualizar-nip"),
    path('validar-cuenta', views.validar_cuenta, name="validar-cuenta"),
    path('pago', views.pago, name="pago"),
    path('consulta_saldo', views.consulta_saldo, name="consulta_saldo"),
    path('retiros', views.retiros, name="retiros")
]
