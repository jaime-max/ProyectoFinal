<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Libro extends Model{
    protected $table = 'modelo_libro';
    protected $fillable = ['isbn','nombre','tipo','autor','idioma','precio','cantidad','date_created'];


    public $timestamps = false;

    protected $primaryKey = 'libro_id';
}