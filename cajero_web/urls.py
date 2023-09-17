from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name="index"),
    path('actualizar-nip', views.actualizar_nip, name="actualizar-nip")
]
