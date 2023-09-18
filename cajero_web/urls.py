from django.urls import path, re_path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('actualizar-nip/', views.actualizar_nip, name='actualizar-nip'),
    path('validar-cuenta/', views.validar_cuenta, name='validar-cuenta'),
    re_path(r'^validar-cuenta/(?P<view>\w)/$', views.validar_cuenta),
    path('realizar-pago/', views.realizar_pago, name='realizar-pago'),
    path('operacion-exitosa/<int:operacion_id>', views.operacion_exitosa, name='operacion-exitosa'),
    path('consultar-saldo/', views.consultar_saldo, name="consultar-saldo"),
    path('retirar-saldo/', views.retirar_saldo, name="retirar-saldo")
]
