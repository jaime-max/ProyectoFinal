from django.db import models

# Create your models here.
class Cliente(models.Model):

    listaGenero = (
        ('femenino','Femenino'),
        ('masculino', 'Masculino')
    )


    cliente_id = models.AutoField(primary_key = True)
    cedula = models.CharField(max_length = 10, unique = True, null = False)
    nombres = models.CharField(max_length = 70, null = False)
    apellidos = models.CharField(max_length = 70, null = False)
    genero = models.CharField(max_length = 30, choices = listaGenero, default = 'femenino')
    correo = models.EmailField(max_length = 105, null = False)
    celular = models.CharField(max_length = 15, null = False)
    direccion = models.TextField(max_length = 200)
    date_created = models.DateTimeField(auto_now_add = True)

    def __str__ (self):
        return self.cedula

class Libro(models.Model):
    listaTipolibros = (
        ('revista','Revista'),
        ('novelas','Novelas'),
        ('literatura','Literatura'),
    )

    libro_id = models.AutoField(primary_key = True)
    isbn = models.CharField(max_length = 70, null = False)
    nombre = models.CharField(max_length = 70, null = False)
    tipo = models.CharField(max_length=30, choices = listaTipolibros, default = 'revista')
    autor = models.CharField(max_length = 70, null = False)
    idioma = models.CharField(max_length = 70, null = False)
    precio = models.DecimalField(max_digits = 10, decimal_places = 2, null = False)
    cantidad= models.IntegerField(null = False)
    date_created = models.DateTimeField(auto_now_add = True)
         
    def __str__(self):
        return self.isbn

class Venta(models.Model):

    venta_id = models.AutoField(primary_key = True)
    fecha = models.DateTimeField(auto_now_add = True, null = False)
    valor = models.DecimalField(max_digits = 10, decimal_places = 2, null = False)
    descripcion = models.TextField(default = 'Descripción de la venta')
    cantlibros = models.IntegerField(null = False)
    libr = models.ForeignKey(Libro, on_delete = models.CASCADE)
    cliente = models.ForeignKey(Cliente, on_delete = models.CASCADE)
    date_created = models.DateTimeField(auto_now_add = True)
    updated_ad = models.DateTimeField(auto_now_add = True)

    def __str__(self):
        return self.venta_id