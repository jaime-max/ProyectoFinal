from django.contrib import admin


from apps.modelo.models import Cliente
from apps.modelo.models import Libro


admin.site.register(Cliente)


admin.site.register(Libro)
