from django.contrib import admin
from .models import Cliente, Cuenta, Operacion


@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    pass


@admin.register(Cuenta)
class CuentaAdmin(admin.ModelAdmin):
    pass


@admin.register(Operacion)
class OperacionAdmin(admin.ModelAdmin):
    pass