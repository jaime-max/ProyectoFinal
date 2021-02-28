<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Libro;
use App\Http\Helper\ResponseBuilder;
use BD;

class LibroController extends Controller
{

    public function __construct(){

    }

    public function allSinRestricciones(Request $request)
    {
        $libro = Libro::all();
        $status = true;
        $info = "Libro List";
        return ResponseBuilder::result($status,$info,$libro);
    }

    public function allJson(Request $request){
        if($request->isJson()){
            $libro = Libro::all();
            $status = true;
            $info = "Libro List";
            return ResponseBuilder::result($status,$info,$libro);
            
        }
        $status = false;
        $info = "Unauthorized";
        return response()->json(['error'=>'Unauthorized'],401,[]);
    }

    public function get_Libro(Request $request, $isbn){
        if ($request->isJson()){
            $libro = Libro::where('isbn', $isbn)->first();
            if(!empty($libro)){
                $status = true;
                $info = "Libro is Here";
                return ResponseBuilder::result($status, $info, $libro);
            } else {
                $status = false;
                $info = "Is doesn't here";
                return ResponseBuilder::result($status, $info);
            }
        } else {
            $status = false;
            $info = "Error: Anauthorizade";
            return ResponseBuilder::result($status, $info);
        }
    }

    public function crear(Request $request){
        if ($request->isJson()){
            $data = $request->json()->all();
            $libro = Libro::create([
                'isbn' => $data['isbn'],
                'nombre' => $data['nombre'],
                'tipo' => $data['tipo'],
                'autor' => $data['autor'],
                'idioma' => $data['idioma'],
                'precio' => $data['precio'],
                'cantidad' => $data['cantidad'],
                'date_created' => $data['date_created'],
            ]);
            $status = true;
            $info = "Libro create succes";
            return ResponseBuilder::result($status, $info, $libro);
        }
        return response()->json(['error'=>'Unauthorized'],401,[]);
    }

    public function eliminarLibro(Request $request, $isbn){
        if ($request->isJson()){
            $libro = Libro::where('isbn', $isbn)->first();
            if(!empty($libro)){
                
                $libro->delete();
                $status = true;
                $info = "Libro is delete";
                return ResponseBuilder::result($status, $info);
            } else {
                $status = false;
                $info = "Is doesn't here";
                return ResponseBuilder::result($status, $info);
            }
        } else {
            $status = false;
            $info = "Error: Anauthorizade";
            return ResponseBuilder::result($status, $info);
        }
    }

}
