<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Proceso extends Model
{
    protected $table = 'PRO_PROCESO';

    protected $primaryKey = 'PRO_ID';
    protected $fillable = [
        'PRO_NOMBRE',
        'PRO_PREFIJO',
        
        
    ];

    public function documentos()
    {
        return $this->hasMany(Documento::class, 'DOC_ID_PROCESO');
    }
}
