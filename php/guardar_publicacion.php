<?php
session_start();
header('Content-Type: application/json');

// Verifica si el usuario ha iniciado sesión
if (!isset($_SESSION['user_id'])) {
    // Si no hay una sesión, redirige al login
    echo json_encode(['status' => 'error', 'message' => 'Usuario no autenticado']);
    http_response_code(401); // Código HTTP para "No autorizado"
    exit;
}

// Datos de conexión a la base de datos
$servername = "junction.proxy.rlwy.net";
$username = "root";
$password = "YZCKInkkMTdDcVYWnQrqtilGayUcFmQv";
$dbname = "ux";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica la conexión
if ($conn->connect_error) {
    die(json_encode(['status' => 'error', 'message' => 'Conexión fallida: ' . $conn->connect_error]));
}

// Obtén los datos JSON enviados
$data = json_decode(file_get_contents("php://input"), true);
$content = $data['content'];
$category_id = 1; // ID de la categoría (ejemplo: Dark Souls)
$user_id = $_SESSION['user_id']; // Toma el ID del usuario de la sesión

// Prepara y ejecuta la consulta
$stmt = $conn->prepare("INSERT INTO publicaciones (contenido, id_cat, id_user) VALUES (?, ?, ?)");
$stmt->bind_param("sii", $content, $category_id, $user_id);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success', 'message' => 'Publicación guardada correctamente']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error al guardar la publicación: ' . $stmt->error]);
}

// Cerrar la conexión y liberar recursos
$stmt->close();
$conn->close();
?>
