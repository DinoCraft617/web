<?php
session_start(); // Iniciar la sesión al principio

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
    $usuario = $conn->real_escape_string($_POST['user']);
    $contraseña = $conn->real_escape_string($_POST['password']);

    // Consulta para verificar si el usuario y la contraseña coinciden
    $sql = "SELECT id_user FROM usuario WHERE usuario = '$usuario' AND contraseña = '$contraseña'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // Guardar el ID del usuario en la sesión
        $_SESSION['user_id'] = $row['id_user'];
       

        // Redirigir a la página home.html
        echo "success";
    } else {
        // Usuario o contraseña incorrectos, devolver error
        echo "error";
    }
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
