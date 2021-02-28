from django import forms
from apps.modelo.models import Venta

class FormularioventaLibro(forms.ModelForm):
    class Meta:
        model = Venta
        fields = ["cantlibros", "descripcion"] 