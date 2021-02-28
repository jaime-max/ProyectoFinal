<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});
$router -> group(['prefix' => 'cliente'], function($router){
    $router -> group(['middleware' => 'auth'], function() use ($router){
        
    });
    $router -> post('new','ClienteController@create'); 
    $router -> get('all', 'ClienteController@allSinRestricciones');
    $router -> get('allJson', 'ClienteController@allJson');
    $router -> get('get/{cedula}','ClienteController@getCliente');
    $router -> get('delete/{cedula}','ClienteController@delete_Cliente');
}); 

$router -> group(['prefix' => 'libro'], function($router){
    $router -> group(['middleware' => 'auth'], function() use ($router){
        
    });
    $router -> post('new','LibroController@crear'); 
    $router -> get('all', 'LibroController@allSinRestricciones');
    $router -> get('allJson', 'LibroController@allJson');
    $router -> get('get/{isbn}','LibroController@get_Libro');
    $router -> get('delete/{isbn}','LibroController@eliminarLibro');
}); 


$router -> group(['prefix' => 'venta'], function($router){
    $router -> group(['middleware' => 'auth'], function() use ($router){
        
    });
    $router -> post('vender/{cedula}/{isbn}','VentaController@vender'); 
}); 



$router -> group(['prefix' => 'usuario'], function($router){
    $router -> post('ingresar', 'UserController@login');
    $router -> post('salir', 'UserController@logout');
}); 