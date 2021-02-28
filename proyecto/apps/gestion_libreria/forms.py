from django import forms
from apps.modelo.models import Cliente, Libro

class FormularioCliente(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ["cedula","apellidos","nombres","genero","correo","celular","direccion"]

class FormularioLibro(forms.ModelForm):
    class Meta:
        model = Libro
        fields = ["isbn","nombre","autor","idioma","precio","tipo","cantidad"]


       