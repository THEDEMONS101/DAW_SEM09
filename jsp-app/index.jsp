<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab 09 | Registro JSP Profesional</title>
    <style>
        :root {
            --primary: #059669; /* Verde distintivo para JSP */
            --primary-hover: #047857;
            --bg: #F3F4F6;
            --card-bg: #FFFFFF;
            --text: #1F2937;
        }
        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background: var(--card-bg);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-weight: 600;
        }
        .form-group { margin-bottom: 1.2rem; }
        label { display: block; font-weight: 500; margin-bottom: 0.4rem; font-size: 0.9rem; }
        input[type="text"], input[type="email"] {
            width: 100%; padding: 0.75rem; border: 1px solid #D1D5DB;
            border-radius: 6px; box-sizing: border-box; font-size: 1rem;
        }
        input:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.1); }
        button {
            width: 100%; padding: 0.85rem; background-color: var(--primary);
            color: white; border: none; border-radius: 6px; font-size: 1rem;
            font-weight: 600; cursor: pointer; margin-top: 0.5rem;
        }
        button:hover { background-color: var(--primary-hover); }
    </style>
</head>
<body>
    <div class="card">
        <h2>Registro de Contacto (JSP)</h2>
        <form action="procesar.jsp" method="POST">
            <div class="form-group">
                <label for="nombre">Nombre Completo</label>
                <input type="text" id="nombre" name="nombre" required placeholder="Ej. Ana Gómez">
            </div>
            <div class="form-group">
                <label for="correo">Correo Electrónico</label>
                <input type="email" id="correo" name="correo" required placeholder="ana@ejemplo.com">
            </div>
            <button type="submit">Enviar Registro</button>
        </form>
    </div>
</body>
</html>