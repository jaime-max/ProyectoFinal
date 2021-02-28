
from apps.modelo.models import Cliente, Libro,Venta
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group, User  
from .forms import FormularioventaLibro

@login_required
def getCliente(request):
    total="0"
    usuario = request.user
    if usuario.groups.filter(name = "venta_libros").exists():

        listaClientes = Cliente.objects.all()
       
        return render (request, 'venta_libros/get_cliente.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())

@login_required
def getLibro(request, cedula,total):
    cliente = Cliente.objects.get(cedula=cedula)
    usuario = request.user
    if usuario.groups.filter(name='venta_libros').exists():
        listaLibros = Libro.objects.all()
        return render(request, 'venta_libros/get_libro.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())


@login_required
def vender(request, cedula, isbn, total):
    usuario = request.user
    if usuario.groups.filter(name='venta_libros').exists():
        formulario_venta = FormularioventaLibro(request.POST)
        cliente = Cliente.objects.get(cedula=cedula)
        libro = Libro.objects.get(isbn=isbn)
        print("toy aqui")
        if request.method == 'POST':
            print(formulario_venta.is_valid())
            if formulario_venta.is_valid():
                print('estoy aqui')
                venta = Venta()
                datos_venta = formulario_venta.cleaned_data
                venta.cantlibros = datos_venta.get('cantlibros')
                venta.descripcion = datos_venta.get('descripcion')
                venta.cliente = cliente
                venta.libr = libro
                venta.valor =  venta.cantlibros * libro.precio
                if venta.cantlibros <= libro.cantidad:
                    libro.cantidad = libro.cantidad-venta.cantlibros
                    pretotal = float(total) + float(venta.valor)
                    total = str(pretotal)
                    venta.save()
                    libro.save()
                    return redirect(getLibro, cedula, total)
                else:
                    return render(request, 'venta_libros/agotado.html',locals()) 
        return render (request, 'venta_libros/vender.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())

@login_required
def finVenta(request,cedula,total):
    usuario = request.user
    if usuario.groups.filter(name='venta_libros').exists():
        cliente = Cliente.objects.get(cedula=cedula)
        return render(request, 'venta_libros/valorCancelar.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())


                 