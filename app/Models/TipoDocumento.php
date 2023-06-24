<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoDocumento extends Model
{
    protected $table = 'TIP_TIPO_DOC';

    protected $primaryKey = 'TIP_ID';
    protected $fillable = [
        'TIP_NOMBRE',
        'TIP_PREFIJO',
    ];

    public function documentos()
    {
        return $this->hasMany(Documento::class, 'DOC_ID_TIPO');
    }
}
