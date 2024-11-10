<?php
header('Content-Type: application/json');

$servername = "junction.proxy.rlwy.net";
$username = "root";
$password = "YZCKInkkMTdDcVYWnQrqtilGayUcFmQv";
$dbname = "ux";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica la conexión
if ($conn->connect_error) {
    die(json_encode(['status' => 'error', 'message' => 'Conexión fallida: ' . $conn->connect_error]));
}

// Consulta para obtener las publicaciones del catálogo con id_cat = 1
$sql = "SELECT p.contenido, u.usuario 
        FROM publicaciones p 
        JOIN usuario u ON p.id_user = u.id_user 
        WHERE p.id_cat = 3 
        ORDER BY p.id_publi DESC";
$result = $conn->query($sql);

$publicaciones = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $publicaciones[] = $row; // Agregar cada publicación al arreglo
    }
}

// Devuelve las publicaciones en formato JSON
echo json_encode($publicaciones);

$conn->close();
?>
