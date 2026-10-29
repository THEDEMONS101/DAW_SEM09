<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // 1. Validar método POST
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.setStatus(405);
        out.println("<div style='font-family:sans-serif;text-align:center;padding:50px;'><h2 style='color:#DC2626;'>Error 405: Método no permitido</h2></div>");
        return;
    }

    // 2. Obtener parámetros
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");

    // Validación estricta (no vacío y el correo debe tener @)
    if (nombre == null || correo == null || nombre.trim().isEmpty() || correo.trim().isEmpty() || !correo.contains("@")) {
        response.setStatus(400);
        out.println("<div style='font-family:sans-serif;text-align:center;padding:50px;'><h2 style='color:#DC2626;'>Error 400: Datos inválidos</h2></div>");
        return;
    }

    // 3. Guardar en sesión
    HttpSession sesion = request.getSession();
    List<Map<String, String>> registros = (List<Map<String, String>>) sesion.getAttribute("registros");
    if (registros == null) {
        registros = new ArrayList<>();
    }
    
    Map<String, String> nuevoRegistro = new HashMap<>();
    nuevoRegistro.put("nombre", nombre.trim());
    nuevoRegistro.put("correo", correo.trim());
    nuevoRegistro.put("fecha", new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    registros.add(nuevoRegistro);
    sesion.setAttribute("registros", registros);

    // Función auxiliar para escapar HTML y prevenir XSS manualmente
    // (Java no tiene una nativa como htmlspecialchars de PHP, así que la creamos)
%>
<%!
    // Declaración de método auxiliar para sanitizar (se ejecuta a nivel de clase)
    private String sanitize(String input) {
        if (input == null) return "";
        return input.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#x27;");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registros JSP</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #F3F4F6; color: #1F2937; padding: 2rem; margin: 0; }
        .container { max-width: 800px; margin: 0 auto; background: #FFFFFF; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        h3 { color: #059669; border-bottom: 2px solid #E5E7EB; padding-bottom: 0.5rem; }
        table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #E5E7EB; }
        th { background-color: #F9FAFB; font-weight: 600; color: #374151; }
        tr:hover { background-color: #F3F4F6; }
        .btn { display: inline-block; margin-top: 1.5rem; padding: 0.6rem 1.2rem; background-color: #059669; color: white; text-decoration: none; border-radius: 6px; transition: 0.2s; font-weight: 600; }
        .btn:hover { background-color: #047857; }
    </style>
</head>
<body>
    <div class="container">
        <h3>✅ Registros Almacenados (JSP)</h3>
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
                <% 
                int index = 1;
                for (Map<String, String> reg : registros) { 
                %>
                    <tr>
                        <td><%= index++ %></td>
                        <%-- Sanitización manual contra XSS --%>
                        <td><%= sanitize(reg.get("nombre")) %></td>
                        <td><%= sanitize(reg.get("correo")) %></td>
                        <td><%= sanitize(reg.get("fecha")) %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <a href="index.jsp" class="btn">← Volver al Formulario</a>
    </div>
</body>
</html>