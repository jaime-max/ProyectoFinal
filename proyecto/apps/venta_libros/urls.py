from django.urls import path

from . import views

urlpatterns = [
    path('cliente/', views.getCliente, name="get_cliente"),
    path('getlibro/<int:cedula>/<str:total>', views.getLibro, name="get_libro"),
    path('vender/<int:cedula>/<str:isbn>/<str:total>', views.vender, name="vender"),
    path('finVenta/<int:cedula>/<str:total>', views.finVenta, name='finVenta'),  
] 