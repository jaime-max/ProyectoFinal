<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Libro;
use App\Models\Cliente;
use App\Models\Venta;
use App\Http\Helper\ResponseBuilder;
use DB;

class VentaController extends Controller{

    public function __construct(){
        //
    }
    public function vender(Request $request, $cedula, $isbn){
        if ($request->isJson()){
            $cliente = Cliente::where('cedula', $cedula)->first();
            if(!empty($cliente)){
                $libro = Libro::where('isbn',$isbn)->first();
                if(!empty($libro)){
                    $data = $request->json()->all();
                    if ($data['cantlibros']<=$libro->cantidad && $data['cantlibros']>0){
                        $venta = Venta::create([
                            'fecha' => $data['fecha'],
                            'valor' => $data['cantlibros']*$libro->precio,
                            'descripcion' => $data['descripcion'],
                            'cantlibros' => $data['cantlibros'],
                            'libr_id' => $libro->libro_id,
                            'cliente_id' => $cliente->cliente_id,
                            'date_created' => $data['date_created'],
                            'updated_ad' => $data['updated_ad'],
                            ]);
                        $libro->cantidad = $libro->cantidad-$data['cantlibros'];
                        $libro->save();
                        $status = true;
                        $info = "Venta con exito";
                        return ResponseBuilder::result($status, $info, $venta.$libro);
                    } else {
                        $status = false;
                        $info = "no hay esa cantidad de libros";
                        return ResponseBuilder::result($status, $info);
                    } 
                } else {
                    $status = false;
                    $info = "El Libro no existe";
                    return ResponseBuilder::result($status, $info);
            }
            } else {
                $status = false;
                $info = "No existe el cliente";
                return ResponseBuilder::result($status, $info);
            }
        } else {
            $status = false;
            $info = "Error: Anauthorizade";
            return ResponseBuilder::result($status, $info);
        }
    }
}