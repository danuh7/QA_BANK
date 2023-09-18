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

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'banco'


class Cliente(models.Model):
    id_cliente = models.SmallAutoField(primary_key=True)
    primer_nombre = models.CharField(max_length=15)
    segundo_nombre = models.CharField(max_length=15, blank=True)
    apellido_paterno = models.CharField(max_length=15)
    apellido_materno = models.CharField(max_length=15)

    def __str__(self):
        return f"{self.apellido_paterno} {self.apellido_materno} {self.primer_nombre}"

    class Meta:
        managed = False
        db_table = 'cliente'


class Cuenta(models.Model):
    id_cuenta = models.SmallAutoField(primary_key=True)
    numero_cuenta = models.CharField(max_length=10)
    monto = models.FloatField()
    id_banco = models.ForeignKey('Banco', models.DO_NOTHING, db_column='id_banco')
    id_tipo_cuenta = models.ForeignKey('TipoCuenta', models.DO_NOTHING, db_column='id_tipo_cuenta')
    id_cliente = models.ForeignKey('Cliente', models.DO_NOTHING, db_column='id_cliente')
    nip = models.CharField(db_column='NIP', max_length=4)  # Field name made lowercase.

    def __str__(self):
        return str(self.id_cliente)

    def tiene_saldo(self, monto_a_descontar):
        return self.monto >= monto_a_descontar

    class Meta:
        managed = False
        db_table = 'cuenta'


class FormaPago(models.Model):
    id_forma = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'forma_pago'


class Operacion(models.Model):
    id_operacion = models.SmallAutoField(primary_key=True)
    fecha = models.DateField(blank=True, null=True)
    hora = models.TimeField(blank=True, null=True)
    monto = models.FloatField()
    id_tipo_operacion = models.ForeignKey('TipoOperacion', models.DO_NOTHING, db_column='id_tipo_operacion')
    id_destino = models.ForeignKey(
        Cuenta,
        models.DO_NOTHING,
        db_column='id_destino',
        blank=True,
        null=True,
    )
    id_forma = models.ForeignKey(
        FormaPago,
        models.DO_NOTHING,
        db_column='id_forma',
        blank=True,
        null=True,
    )
    id_origen = models.ForeignKey(
        Cuenta,
        models.DO_NOTHING,
        db_column='id_origen',
        related_name='operacion_id_origen_set'
    )

    def realizar_operacion(self, nuevo_nip=''):
        tipo_operacion = self.id_tipo_operacion

        if tipo_operacion in [1, 2, 3]:
            if self.id_origen.tiene_saldo(self.monto):
                self.id_origen.monto -= self.monto
                self.id_origen.save()
            else:
                raise Exception("No tienes saldo suficiente")
        elif tipo_operacion == 4:
            self.nip = nuevo_nip

        self.save()

    class Meta:
        managed = False
        db_table = 'operacion'


class TipoCuenta(models.Model):
    id_tipo_cuenta = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'tipo_cuenta'


class TipoOperacion(models.Model):
    id_tipo = models.SmallAutoField(primary_key=True)
    nombre = models.CharField(max_length=25)

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'tipo_operacion'
