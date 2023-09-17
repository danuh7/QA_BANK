from django.db import models

# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Banco(models.Model):
    id_banco = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'banco'


class Cliente(models.Model):
    id_cliente = models.SmallAutoField(primary_key=True)
    primer_nombre = models.CharField(max_length=15)
    segundo_nombre = models.CharField(max_length=15)
    apellido_paterno = models.CharField(max_length=15)
    apellido_materno = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'cliente'


class Cuenta(models.Model):
    id_cuenta = models.SmallAutoField(primary_key=True)
    numero_cuenta = models.CharField(max_length=10)
    monto = models.FloatField()
    id_banco = models.SmallIntegerField(blank=True, null=True)
    id_tipo_cuenta = models.ForeignKey('TipoCuenta', models.DO_NOTHING, db_column='id_tipo_cuenta', blank=True, null=True)
    id_cliente = models.SmallIntegerField(blank=True, null=True)
    nip = models.CharField(db_column='NIP', max_length=4)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cuenta'


class FormaPago(models.Model):
    id_forma = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'forma_pago'


class Operacion(models.Model):
    id_operacion = models.SmallAutoField(primary_key=True)
    fecha = models.DateField(blank=True, null=True)
    hora = models.TimeField(blank=True, null=True)
    monto = models.FloatField()
    id_tipo_operacion = models.ForeignKey('TipoOperacion', models.DO_NOTHING, db_column='id_tipo_operacion', blank=True, null=True)
    id_destino = models.ForeignKey(Cuenta, models.DO_NOTHING, db_column='id_destino', blank=True, null=True)
    id_forma = models.ForeignKey(FormaPago, models.DO_NOTHING, db_column='id_forma', blank=True, null=True)
    id_origen = models.ForeignKey(Cuenta, models.DO_NOTHING, db_column='id_origen', related_name='operacion_id_origen_set', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'operacion'


class TipoCuenta(models.Model):
    id_tipo_cuenta = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'tipo_cuenta'


class TipoOperacion(models.Model):
    id_tipo = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'tipo_operacion'

