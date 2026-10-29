# 🚀 Laboratorio 09A - Sistema de Registro de Contacto (PHP & JSP)

**Asignatura:** Desarrollo de Aplicaciones Web (IS093A)  
**Universidad:** Universidad Nacional del Centro del Perú  
**Facultad:** Ingeniería de Sistemas  
**Integrantes:** [Tu Nombre] y [Nombre de tu compañero]  

---

## 📌 Descripción del Proyecto
Implementación de un Sistema de Registro de Contacto utilizando dos tecnologías Backend: **PHP (con XAMPP)** y **JSP (con Apache Tomcat)**. Ambas aplicaciones permiten el ingreso de datos (Nombre y Correo), los validan, sanitizan (prevención XSS), los almacenan en sesión (`$_SESSION` y `HttpSession`) y muestran una respuesta estructurada en una tabla.

---

## 🌐 3. Ciclo HTTP (Documentación del Flujo)

El siguiente diagrama describe el flujo completo desde que el usuario interactúa con el navegador hasta que se renderiza la respuesta, aplicado a ambas aplicaciones (PHP en puerto 80 y JSP en puerto 8080).

```text
[ CLIENTE (Navegador) ]
      │
      │ 1. Ingresa URL: http://localhost/php-app/index.html
      ▼
[ DNS RESOLUTION ]
      │ 2. Traduce "localhost" a 127.0.0.1
      ▼
[ TCP/IP ]
      │ 3. Handshake TCP (3 vías) en Puerto 80 (Apache) o 8080 (Tomcat)
      ▼
[ HTTP REQUEST ]
      │ 4. GET /php-app/index.html HTTP/1.1
      ▼
[ SERVIDOR WEB (Apache / Tomcat) ]
      │ 5. Recibe la petición y busca el recurso
      │
      │ 6. El Cliente envía Formulario (POST)
      │    POST /php-app/procesar.php (o procesar.jsp)
      ▼
[ BACKEND (PHP / JSP) ]
      │ 7. Valida método POST
      │ 8. Sanitiza y valida inputs (filter_input / getParameter)
      │ 9. Almacena en Sesión ($_SESSION / HttpSession)
      │ 10. Genera HTML de respuesta (Tabla de registros)
      ▼
[ HTTP RESPONSE ]
      │ 11. Status 200 OK + Cuerpo HTML
      ▼
[ CLIENTE (Navegador) ]
      │ 12. Interpreta HTML, carga CSS y RENDERIZA la tabla
      ▼
[ USUARIO ]