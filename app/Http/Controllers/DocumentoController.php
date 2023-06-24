<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Documento;
use App\Models\TipoDocumento;
use App\Models\Proceso;

class DocumentoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function index(Request $request)
    {
        // Obtener los parámetros de consulta
        $nombre = $request->query('nombre');
        $tipo = $request->query('tipo');
        $proceso = $request->query('proceso');
    
        // Obtener todos los documentos con información adicional
        $query = Documento::with('tipoDocumento', 'proceso');
    
        // Verificar si se proporcionó el parámetro "nombre" y filtrar los documentos por nombre
        if ($nombre) {
            $query->where('DOC_NOMBRE', 'LIKE', '%' . $nombre . '%');
        }
    
        // Verificar si se proporcionó el parámetro "tipo" y filtrar los documentos por tipo
        if ($tipo) {
            $query->where('DOC_ID_TIPO', $tipo);
        }
        
        // Verificar si se proporcionó el parámetro "proceso" y filtrar los documentos por tipo
        if ($proceso) {
            $query->where('DOC_ID_PROCESO', $proceso);
        }
    
        // Obtener los documentos paginados (10 documentos por página)
        $documentos = $query->get();
    
        return response()->json($documentos);
    }
    
    public function store(Request $request)
    {
        // Validar los datos del documento
        $data = $request->validate([
            'DOC_NOMBRE' => 'required',
            'DOC_ID_TIPO' => 'required',
            'DOC_ID_PROCESO' => 'required',
            'DOC_CONTENIDO' => 'required',
        ]);
    
        // Obtener el prefijo del tipo de documento
        $tipoDocumento = TipoDocumento::find($data['DOC_ID_TIPO']);
        $tipoPrefijo = $tipoDocumento->TIP_PREFIJO;
    
        // Obtener el prefijo del proceso
        $proceso = Proceso::find($data['DOC_ID_PROCESO']);
        $procesoPrefijo = $proceso->PRO_PREFIJO;
    
        // Generar el código único consecutivo para el documento
        $consecutivo = Documento::count() + 1;
        $codigo = $tipoPrefijo . '-' . $procesoPrefijo . '-' . $consecutivo;
    
        // Agregar el código al array de datos
        $data['DOC_CODIGO'] = $codigo;
    
        // Crear el nuevo documento
        $documento = Documento::create($data);
    
        return response()->json($documento, 201);
    }
    
    public function show($id)
    {
        // Obtener el documento por ID con información adicional
        $documento = Documento::with('tipoDocumento', 'proceso')->find($id);
    
        if (!$documento) {
            return response()->json(['error' => 'Documento no encontrado'], 404);
        }
    
        return response()->json($documento);
    }
    
    public function update(Request $request, $id)
    {
        // Validar los datos del documento
        $data = $request->validate([
            'DOC_NOMBRE' => 'required',
            'DOC_ID_TIPO' => 'required',
            'DOC_ID_PROCESO' => 'required',
            'DOC_CONTENIDO' => 'required',
        ]);
    
        // Buscar el documento por ID
        $documento = Documento::find($id);
    
        if (!$documento) {
            return response()->json(['error' => 'Documento no encontrado'], 404);
        }
    
        // Obtener el prefijo del tipo de documento
        $tipoDocumento = TipoDocumento::find($data['DOC_ID_TIPO']);
        $tipoPrefijo = $tipoDocumento->TIP_PREFIJO;
    
        // Obtener el prefijo del proceso
        $proceso = Proceso::find($data['DOC_ID_PROCESO']);
        $procesoPrefijo = $proceso->PRO_PREFIJO;
    
        // Generar el código único consecutivo para el documento
        $consecutivo = Documento::count();
        $codigo = $tipoPrefijo . '-' . $procesoPrefijo . '-' . $consecutivo;
    
        // Actualizar los datos del documento
        $documento->update(array_merge($data, ['DOC_CODIGO' => $codigo]));
    
        return response()->json($documento);
    }
    
    public function destroy($id)
    {
        // Buscar el documento por ID
        $documento = Documento::find($id);
    
        if (!$documento) {
            return response()->json(['error' => 'Documento no encontrado'], 404);
        }
    
        // Eliminar el documento
        $documento->delete();
    
        return response()->json(['message' => 'Documento eliminado']);
    }

    public function getTiposDocumentos()
    {
        // Obtener todos los tipos de documentos
        $tiposDocumentos = TipoDocumento::all();

        return response()->json($tiposDocumentos);
    }

    public function getProcesosDocumentos()
    {
        // Obtener todos los procesos de documentos
        $procesosDocumentos = Proceso::all();

        return response()->json($procesosDocumentos);
    }
}
