API de Gestión de Documentos con Laravel
Esta es una API desarrollada en Laravel que proporciona funcionalidades para gestionar documentos. La API utiliza el paquete Sanctum para la autenticación y autorización de usuarios.

Requisitos
    • PHP 8
    • Laravel 10.x
    • Composer
    
Instalación
    1. Clone el repositorio:
       git clone https://github.com/guzmanbluis28/API_documents_manager.git
       
    2. Navegue al directorio del proyecto en la terminal:
       cd API_documents_manage
       
    3. Instale las dependencias de Composer en la terminal: 
       composer install
       
    4. Configuración del entorno:
        ◦ Configura la conexión de base de datos en el archivo .env:
          DB_CONNECTION=mysql
          DB_HOST=127.0.0.1
          DB_PORT=3306
          DB_DATABASE=innclod
          DB_USERNAME=tu-usuario
          DB_PASSWORD=tu-contraseña
        ◦ El archivo con la BD la encontrará también en el repositorio, es el archivo llamdo innclod.sql, descarguela e importela en php MyAdmin o el administrador de su preferencia
        
    5. Ubíquese en la carpeta/direcetorio raíz e inicie el servidor de desarrollo desde la terminal:
       php artisan serve
       
Uso de la API
Una vez que la API esté en funcionamiento, puede realizar solicitudes HTTP a las siguientes rutas:
    • POST /api/register - Registrar un nuevo usuario.
    • POST /api/login - Iniciar sesión y obtener un token de acceso.
    • POST /api/logout - Cerrar sesión y revocar el token de acceso actual.
    • GET /api/documentos – ver todos los documentos (requiere autenticación).
        Respuesta en postman en formato JSON es:
        {
        	"DOC_ID": 9,
        	"DOC_NOMBRE": "formulario",
        	"DOC_CODIGO": "FOR-FIN-3",
        	"DOC_CONTENIDO": "otro doc de finanzas",
        	"DOC_ID_TIPO": 3,
        	"DOC_ID_PROCESO": 3,
        	"created_at": "2023-06-23T18:34:30.000000Z",
        	"updated_at": "2023-06-23T18:34:30.000000Z",
        	"tipo_documento": {
        	"TIP_ID": 3,
        	"TIP_NOMBRE": "Formulario",
        	"TIP_PREFIJO": "FOR"
        	},
        	"proceso": {
        	"PRO_ID": 3,
        	"PRO_PREFIJO": "FIN",
        	"PRO_NOMBRE": "Finanzas"
        	}
        	}
    • POST /api/documentos – Crear nuevos documentos (requiere autenticación).
      Mensaje tipo JSON:
        {
        "DOC_NOMBRE": "Nuevo documento",
        "DOC_ID_TIPO": 1,
        "DOC_ID_PROCESO": 2,
        "DOC_CONTENIDO": "nuevo documento texto"
        }
    • GET /api/documentos/{id} - Obtener detalles de un documento específico (requiere autenticación).
    • PUT /api/documentos/{id} - Actualizar un documento específico (requiere autenticación).
    • DELETE /api/documentos/{id} - Eliminar un documento específico (requiere autenticación).
    • GET /api/tipos-documentos – ver todos los tipos de documentos (requiere autenticación).
    • GET /api/procesos-documentos – ver todos los procesos de documentos (requiere autenticación).
    
Pruebas  y ejecución
Para probar cada ruta y verificar que todo está bien, recomiendo utilizar Postman
