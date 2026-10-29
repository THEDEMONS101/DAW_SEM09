<?php
// 1. Validar estrictamente el método POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    die("<h2>Error 405: Método no permitido</h2>");
}

// 2. Validación y Sanitización Profesional
$nombre_raw = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$correo_raw = filter_input(INPUT_POST, 'correo', FILTER_VALIDATE_EMAIL);

// Limpiar espacios y verificar vacíos
$nombre = trim($nombre_raw);
$correo = trim($correo_raw);

if (empty($nombre) || !$correo) {
    http_response_code(400);
    die("<h2>Error 400: Datos inválidos. Asegúrese de ingresar un nombre y un correo electrónico válido.</h2>");
}

// 3. Gestión de Sesión Segura
session_start();
if (!isset($_SESSION['registros'])) {
    $_SESSION['registros'] = [];
}

// Guardar registro
$_SESSION['registros'][] = [
    'nombre' => $nombre,
    'correo' => $correo,
    'fecha'  => date('Y-m-d H:i:s') // Añadimos fecha para realismo
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registros PHP</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #F3F4F6; color: #1F2937; padding: 2rem; }
        .container { max-width: 800px; margin: 0 auto; background: #FFFFFF; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        h3 { color: #4F46E5; border-bottom: 2px solid #E5E7EB; padding-bottom: 0.5rem; }
        table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #E5E7EB; }
        th { background-color: #F9FAFB; font-weight: 600; color: #374151; }
        tr:hover { background-color: #F3F4F6; }
        .btn { display: inline-block; margin-top: 1.5rem; padding: 0.6rem 1.2rem; background-color: #4F46E5; color: white; text-decoration: none; border-radius: 6px; transition: 0.2s; }
        .btn:hover { background-color: #4338CA; }
    </style>
</head>
<body>
    <div class="container">
        <h3>✅ Registros Almacenados (PHP)</h3>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Fecha de Registro</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($_SESSION['registros'] as $index => $reg): ?>
                    <tr>
                        <td><?= $index + 1 ?></td>
                        <!-- Sanitización estricta contra XSS usando ENT_QUOTES -->
                        <td><?= htmlspecialchars($reg['nombre'], ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars($reg['correo'], ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars($reg['fecha'], ENT_QUOTES, 'UTF-8') ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <a href="index.html" class="btn">← Volver al Formulario</a>
    </div>
</body>
</html>