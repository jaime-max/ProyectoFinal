<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model{
    protected $table = 'modelo_venta';
    protected $fillable = ['fecha','valor','descripcion','cantlibros','date_created','updated_ad','cliente_id','libr_id'
    ];

    public $timestamps = false;
    
    //protected $primaryKey = 'venta_id';
    /*protected $hidden = [
        'cliente_id'
    ];*/
}