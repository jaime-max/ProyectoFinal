from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='clientes'),
    path('crearClientes', views.crearCliente, name='crear_clientes'),
    path('modificarCliente/<int:cedula>/', views.modificarCliente, name='modificar_cliente'),
    path('eliminarCliente/<int:cedula>/', views.eliminarCliente, name='eliminar_cliente'),

    path('libro', views.listarLibros, name="libro"),
    path('crearLibros', views.crearLibros, name='crear_libros'),
    path('modificarLibro/<str:isbn>/', views.modificarLibro, name='modificar_libro'),
    path('eliminarLibro/<str:isbn>', views.eliminarLibro, name='eliminar_libro'),
    
]