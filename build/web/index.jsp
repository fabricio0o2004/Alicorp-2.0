<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Supermercado - Menú Principal</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

        <!-- Estilos personalizados -->
        <style>
            /* ------------------------------
               PALETA ALICORP
               Rojo: #D71920
               Rojo Oscuro: #B3121A
               Gris Claro: #F7F7F7
               Gris Suave: #E5E5E5
               Texto Gris: #444
            --------------------------------*/

            body {
                font-family: 'Quicksand', sans-serif;
                background: #F7F7F7;
                margin: 0;
                padding: 0;
                color: #444;
            }

            /* ------------------------------
               NAVBAR
            --------------------------------*/
            .navbar-custom {
                background-color: #D71920;
                padding: 12px 20px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            }

            .navbar-custom .navbar-brand,
            .navbar-custom .nav-link {
                color: #fff !important;
                font-weight: 600;
            }

            .navbar-custom .nav-link:hover {
                color: #FFEDED !important;
            }

            /* ------------------------------
               HERO HEADER
            --------------------------------*/
            .hero-header {
                background: linear-gradient(to right, #D71920, #B3121A);
                color: white;
                padding: 70px 20px;
                text-align: center;
                position: relative;
                border-bottom: 8px solid #F7F7F7;
            }

            .hero-header h1 {
                font-size: 3rem;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .hero-header p {
                font-size: 1.2rem;
                font-weight: 300;
                opacity: 0.95;
                margin-top: 0;
            }

            .hero-icon {
                font-size: 3.2rem;
                margin-bottom: 20px;
            }

            /* ------------------------------
               CARD PRINCIPAL
            --------------------------------*/
            .card {
                background-color: #fff;
                border-radius: 1rem;
                box-shadow: 0 10px 28px rgba(0,0,0,0.12);
                padding: 2.5rem;
                text-align: center;
                margin-top: -40px;
                max-width: 760px;
                margin-left: auto;
                margin-right: auto;
                border-top: 6px solid #D71920;
            }

            .card p {
                font-size: 1.15rem;
                color: #555;
                margin-bottom: 0;
            }

            /* ------------------------------
               BOTONES
            --------------------------------*/
            .btn-custom {
                background-color: #D71920;
                color: #fff;
                border-radius: 30px;
                padding: 12px 28px;
                font-weight: 600;
                border: none;
                transition: all 0.3s ease-in-out;
            }

            .btn-custom:hover {
                background-color: #B3121A;
                color: #fff;
                transform: translateY(-2px);
                box-shadow: 0 6px 18px rgba(0,0,0,0.2);
            }

            /* ------------------------------
               ICONOS
            --------------------------------*/
            .icono {
                font-size: 2rem;
                margin-right: 8px;
                vertical-align: middle;
            }

            /* ------------------------------
               TABLAS
            --------------------------------*/
            .table-container {
                background: #fff;
                padding: 2rem;
                border-radius: 1rem;
                box-shadow: 0 8px 24px rgba(0,0,0,0.10);
                max-width: 1100px;
                margin: 40px auto;
                border-left: 6px solid #D71920;
                border-right: 6px solid #D71920;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                font-size: 0.95rem;
            }

            th {
                background: #D71920;
                color: #fff;
                padding: 12px;
                font-weight: 600;
                text-align: center;
            }

            td {
                padding: 10px;
                border-bottom: 1px solid #E5E5E5;
            }

            table input {
                border: none;
                background-color: transparent;
                font-weight: 500;
                width: 100%;
            }

            tbody tr:hover {
                background: #FFF4F4;
            }

            /* Quitar azul de todos los enlaces */
            a, a:visited {
                color: #D71920 !important; /* Rojo Alicorp */
            }

            /* Hover rojo más oscuro */
            a:hover {
                color: #b9151b !important;
            }

            /* Botones primarios (por si alguno usa bootstrap) */
            .btn-primary,
            .btn-primary:visited {
                background-color: #D71920 !important;
                border-color: #D71920 !important;
            }

            /* Hover del botón primario */
            .btn-primary:hover {
                background-color: #b9151b !important;
                border-color: #b9151b !important;
            }


        </style>


        <!-- Script de cierre por inactividad -->
        <script>
            let tiempoInactivo = 5 * 60 * 1000; // 5 minutos
            let temporizador;

            function reiniciarTemporizador() {
                clearTimeout(temporizador);
                temporizador = setTimeout(() => {
                    window.location.href = 'CerrarSesion.jsp';
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
        <%@ include file="navbar.jsp" %>

        <!-- Encabezado Hero -->
        <header class="hero-header">
            <div class="hero-icon">
                <i class="bi bi-shop-window"></i>
            </div>
            <h1>Bienvenido a Alicorp</h1>
            <p>Tu tienda en línea de confianza — fácil, rápida y siempre disponible</p>
        </header>

        <!-- JS Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
