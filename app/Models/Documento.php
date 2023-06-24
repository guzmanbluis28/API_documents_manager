<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\TipoDocumento;
use App\Models\Proceso;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Documento extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'DOC_DOCUMENTO';

    protected $primaryKey = 'DOC_ID';

    protected $fillable = [
        'DOC_NOMBRE',
        'DOC_CODIGO',
        'DOC_CONTENIDO',
        'DOC_ID_TIPO',
        'DOC_ID_PROCESO',
    ];

    public function proceso()
    {
        return $this->belongsTo(Proceso::class, 'DOC_ID_PROCESO');
    }

    public function tipoDocumento()
    {
        return $this->belongsTo(TipoDocumento::class, 'DOC_ID_TIPO');
    }
}
