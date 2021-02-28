from django.shortcuts import render
from apps.modelo.models import Cliente, Libro 
from .forms import FormularioCliente, FormularioLibro
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group, User  
from django.db.models import Q    

@login_required
def index(request):
    usuario = request.user
    if usuario.groups.filter(name = "gestion_libreria").exists():
        listaClientes = Cliente.objects.all()
        busqueda = request.POST.get("busqueda")
        if busqueda:
            listaClientes = Cliente.objects.filter(
                Q(nombres__icontains = busqueda) | 
                Q(apellidos__icontains = busqueda) | 
                Q(cedula = busqueda)
            ).distinct()  
        return render (request, 'clientes/index.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals()) 

@login_required
def crearCliente(request):
    formulario_cliente = FormularioCliente(request.POST)
    if request.method == 'POST':
        if formulario_cliente.is_valid():

            cliente = Cliente()
            datos_cliente = formulario_cliente.cleaned_data
            cliente.cedula = datos_cliente.get('cedula')
            cliente.nombres = datos_cliente.get('nombres')
            cliente.apellidos = datos_cliente.get('apellidos')
            cliente.genero = datos_cliente.get('genero')
            cliente.correo = datos_cliente.get('correo')
            cliente.celular = datos_cliente.get('celular')
            cliente.direccion = datos_cliente.get('direccion')
            #ORM
            
            cliente.save()
            

            user = User.objects.create_user(cliente.cedula, cliente.correo, cliente.cedula)
            user.first_name = cliente.nombres
            user.last_name = cliente.apellidos
            grupo = Group.objects.get(name = "clientes")#ORM
            user.groups.add(grupo)
            user.save() #ORM

        return redirect(index)
    return render (request, 'clientes/crear.html', locals())

def modificarCliente(request, cedula):
    cliente = Cliente.objects.get(cedula=cedula)
    if request.method == 'GET':
        formulario_cliente = FormularioCliente(instance = cliente)
    else:
        formulario_cliente = FormularioCliente(request.POST, instance = cliente)
        if formulario_cliente.is_valid():
            #ORM
            formulario_cliente.save()
        return redirect(index)
    return render (request, 'clientes/modificar.html', locals())

def eliminarCliente(request, cedula):
    cliente = Cliente.objects.get(cedula=cedula)
    cliente.delete()
    return redirect(index)


@login_required
def listarLibros(request):
    usuario = request.user
    if usuario.groups.filter(name = "gestion_libreria").exists():
        listaLibros = Libro.objects.all()

        busqueda = request.POST.get("busqueda")
        if busqueda:
            listaLibros = Libro.objects.filter(
                Q(nombre__icontains = busqueda) | 
                Q(isbn__icontains = busqueda) 
            ).distinct()  

        return render (request, 'libros/index.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals()) 

@login_required
def crearLibros(request):
    formulario_libro = FormularioLibro(request.POST)
    if request.method == 'POST':
        if formulario_libro.is_valid():
            libros = Libro()
            datos_libro = formulario_libro.cleaned_data
            libros.isbn= datos_libro.get('isbn')
            libros.nombre= datos_libro.get('nombre')
            libros.tipo= datos_libro.get('tipo')
            libros.autor= datos_libro.get('autor')
            libros.idioma= datos_libro.get('idioma')
            libros.precio= datos_libro.get('precio')
            libros.cantidad= datos_libro.get('cantidad')

            libros.save()
        return redirect(listarLibros)
    return render (request, 'libros/crear.html', locals())
@login_required
def modificarLibro(request, isbn):
    libro = Libro.objects.get(isbn=isbn)
    if request.method == 'GET':
        formulario_libro = FormularioLibro(instance = libro)
    else:
        formulario_libro = FormularioLibro(request.POST, instance =libro)
        if formulario_libro.is_valid():
            #ORM
            formulario_libro.save()
        return redirect(index)
    return render (request, 'libros/modificar.html', locals())
    
@login_required
def eliminarLibro(request, isbn):
    libro = Libro.objects.get(isbn=isbn)
    libro.delete()
    return redirect(index)
