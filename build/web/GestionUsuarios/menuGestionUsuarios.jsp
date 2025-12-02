<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gestión de Usuarios</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Quicksand', sans-serif;
                background: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'),
                    linear-gradient(to right, #FDEAEA, #F8D5D5); /* Fondo suave en tonos rojos */
                background-blend-mode: soft-light;
                min-height: 100vh;
            }

            .hero-header {
                background: linear-gradient(to right, #E30613, #B2050F); /* Rojo Alicorp */
                color: white;
                padding: 50px 20px;
                text-align: center;
                font-weight: bold;
                letter-spacing: 1px;
            }

            .menu-container {
                max-width: 600px;
                background: #ffffffee;
                margin: -40px auto 40px auto;
                padding: 2rem;
                border-radius: 1rem;
                box-shadow: 0 8px 24px rgba(227, 6, 19, 0.18); /* Sombra rojiza */
                border-left: 6px solid #E30613; /* Detalle corporativo */
            }

            .btn-custom {
                border-radius: 25px;
                padding: 10px 20px;
                font-weight: 600;
                margin: 10px 5px;
                background: #E30613;   /* Botón rojo principal */
                color: white;
                border: none;
                transition: 0.3s;
            }

            .btn-custom:hover {
                background: #B2050F; /* Hover rojo oscuro */
                transform: translateY(-2px);
            }
        </style>


        <!-- Inactividad -->
        <script>
            let tiempoInactivo = 5 * 60 * 1000; // 5 minutos
            let temporizador;

            function reiniciarTemporizador() {
                clearTimeout(temporizador);
                temporizador = setTimeout(() => {
                    window.location.href = '../CerrarSesion.jsp';
                }, tiempoInactivo);
            }

            window.onload = reiniciarTemporizador;
            document.onmousemove = reiniciarTemporizador;
            document.onkeypress = reiniciarTemporizador;
            document.onclick = reiniciarTemporizador;
            document.onscroll = reiniciarTemporizador;
        </script>
    </head>

    <body>
        <%@ include file="../navbar.jsp" %>

        <header class="hero-header">
            <h1><i class="bi bi-box-seam-fill me-2"></i>Gestión de Usuarios</h1>
        </header>

        <!-- Menú -->
        <main class="menu-container text-center">
            <c:url var="urlListar" value="/ControlUsuario"><c:param name="op" value="Listar"/></c:url>
            <a href="${urlListar}" class="btn btn-primary btn-custom">
                <i class="bi bi-list-ul me-1"></i> Listar Usuarios
            </a>

            <c:url var="urlNuevo" value="/ControlUsuario"><c:param name="op" value="Nuevo"/></c:url>
            <a href="${urlNuevo}" class="btn btn-success btn-custom">
                <i class="bi bi-plus-circle me-1"></i> Crear Nuevo Usuario
            </a>

            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-secondary btn-custom">
                <i class="bi bi-arrow-left-circle me-1"></i> Volver al Menú Principal
            </a>
        </main>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
