<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listado de Usuarios</title>

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
                    linear-gradient(to right, #FBE4E4, #F8D0D0); /* Fondo suave rojizo */
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

            .table-container {
                background: #ffffffee;
                padding: 2rem;
                border-radius: 1rem;
                box-shadow: 0 8px 24px rgba(227, 6, 19, 0.20); /* Sombra rojiza */
                max-width: 1000px;
                margin: -40px auto 40px auto;
                border-left: 6px solid #E30613; /* Detalle corporativo */
            }

            /* Encabezados en rojo */
            table thead th {
                color: #B2050F;
                font-weight: 700;
            }

            /* Datos normales en gris oscuro */
            table tbody td {
                color: #333;
                font-weight: 500;
            }

            table input {
                border: none;
                background-color: transparent;
                font-weight: 500;
                color: #333 !important; /* Se elimina el rojo en inputs */
            }

            .btn-custom {
                border-radius: 25px;
                padding: 8px 20px;
                font-weight: 600;
                background-color: #E30613;
                color: white;
                border: none;
                transition: 0.3s;
            }

            .btn-custom:hover {
                background-color: #B2050F;
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
            <h1><i class="bi bi-box-seam-fill me-2"></i>Listado de Usuarios</h1>
        </header>

        <main class="table-container">
            <c:if test="${not empty sessionScope.lista}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Username</th>
                                <th>Nombre completo</th>
                                <th>Rol</th>
                                <th>Estado</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="usuario" items="${sessionScope.lista}">
                                <tr>
                                    <td><input type="text" value="${usuario.codUsuario}" readonly></td>
                                    <td><input type="text" value="${usuario.username}" readonly></td>
                                    <td><input type="text" value="${usuario.nom}" readonly></td>
                                    <td><input type="text" value="${usuario.perfil}" readonly></td>
                                    <td><input type="text" value="${usuario.est}" readonly></td>
                                        <c:url var="urlConsultar" value="/ControlUsuario">
                                            <c:param name="op" value="Consultar"/>
                                            <c:param name="cod" value="${usuario.codUsuario}"/>
                                        </c:url>
                                    <td>
                                        <a class="btn btn-sm btn-primary" href="${urlConsultar}">
                                            <i class="bi bi-search"></i> Detalles
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <c:if test="${empty sessionScope.lista}">
                <div class="alert alert-warning text-center mt-4">
                    <i class="bi bi-exclamation-circle me-2"></i>No hay usuarios registrados.
                </div>
            </c:if>

            <div class="text-center mt-4">
                <a href="menuGestionUsuarios.jsp" class="btn btn-outline-secondary btn-volver">
                    <i class="bi bi-arrow-left-circle"></i> Volver al menú de gestión
                </a>
            </div>
        </main>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
