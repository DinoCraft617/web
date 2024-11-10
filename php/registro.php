<?php
// Datos de conexión a la base de datos
$servername = "junction.proxy.rlwy.net";
$username = "root";
$password = "YZCKInkkMTdDcVYWnQrqtilGayUcFmQv";
$dbname = "ux";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión a la base de datos: " . $conn->connect_error);
}

// Verificar si los datos del formulario han sido enviados
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir y escapar los datos ingresados
    $newUser = $conn->real_escape_string($_POST['new_user']);
    $newPassword = $conn->real_escape_string($_POST['new_password']); // Guarda la contraseña sin encriptar

    // Insertar el nuevo usuario en la base de datos
    $sql = "INSERT INTO usuario (usuario, contraseña) VALUES ('$newUser', '$newPassword')";

    if ($conn->query($sql) === TRUE) {
        echo "success";
    } else {
        echo "error";
    }
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
