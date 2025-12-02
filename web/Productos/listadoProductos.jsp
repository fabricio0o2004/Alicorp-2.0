<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Listado de Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap y estilos -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

        <style>
        /* ===== Estilo General ===== */
        body {
        font-family: 'Quicksand', sans-serif;
        background: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'),
        linear-gradient(to right, #FBE4E4, #F8D0D0);
        background-blend-mode: soft-light;
        min-height: 100vh;
        }

        /* ===== Encabezado ===== */
        .hero-header {
        background: linear-gradient(to right, #E30613, #B2050F); /* Rojo Alicorp */
        color: white;
        padding: 50px 20px;
        text-align: center;
        font-weight: bold;
        letter-spacing: 1px;
        }

        /* ===== Contenedor de Tabla ===== */
        .table-container {
        background: #ffffffee;
        padding: 2rem;
        border-radius: 1rem;
        box-shadow: 0 8px 24px rgba(227, 6, 19, 0.20);
        max-width: 1100px;
        margin: -40px auto 40px auto;
        border-left: 6px solid #E30613;
        }

        /* ===== Tabla ===== */
        .table thead {
        background: #E30613 !important;  /* Rojo Alicorp */
        color: white !important;
        }

        .table-hover tbody tr:hover {
        background-color: #FDE9E9 !important; /* Suave rosado */
        }

        .table td, 
        .table th {
        vertical-align: middle;
        }

        /* ===== Inputs dentro de la tabla ===== */
        table input {
        border: none;
        background-color: transparent;
        font-weight: 600;
        color: #333 !important;       /* 🔥 Datos en negro */
        pointer-events: none;
        }

        /* ===== Botones ===== */
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

        /* Botón Detalles */
        .btn-outline-primary {
        color: #E30613 !important;
        border-color: #E30613 !important;
        }

        .btn-outline-primary:hover {
        background-color: #E30613 !important;
        color: white !important;
        }


    </style>

    <!-- Tiempo de inactividad -->
    <script>
        let tiempoInactivo = 5 * 60 * 1000;
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
        <h1><i class="bi bi-box-seam-fill me-2"></i>Listado de Productos</h1>
    </header>

    <main class="table-container">
        <c:if test="${param.msg == '2'}">
            <div class="alert alert-success text-center">El producto se eliminó satisfactoriamente.</div>
        </c:if>

        <c:if test="${not empty sessionScope.lista}">
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center">
                    <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Lote</th>
                            <th>Fecha de producción</th>
                            <th>Fecha de vencimiento</th>
                            <th>Ingredientes</th>
                            <th>QR</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${sessionScope.lista}">
                            <tr>
                                <td><input type="text" size="6" value="${producto.codProducto}" readonly/></td>
                                <td><input type="text" size="30" value="${producto.nom}" readonly/></td>
                                <td><input type="text" size="10" value="${producto.des}" readonly/></td>
                                <td><input type="date" size="10" value="${producto.pre}" readonly/></td>
                                <td><input type="date" size="10" value="${producto.est}" readonly/></td>
                                <td><input type="textarea" size="200" value="${producto.nn}" readonly/></td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/QR/qr_${producto.codProducto}.png" width="80" />
                                </td>


                                <td>
                                    <c:url var="urlConsultar" value="/ControlProducto">
                                        <c:param name="op" value="Consultar"/>
                                        <c:param name="cod" value="${producto.codProducto}" />
                                    </c:url>
                                    <a class="btn btn-outline-primary btn-sm" href="${urlConsultar}">
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
            <div class="text-center text-muted">No hay productos registrados.</div>
        </c:if>

        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/Productos/menuProductos.jsp" class="btn btn-outline-secondary btn-custom">
                <i class="bi bi-arrow-left-circle me-1"></i> Volver al menú de productos
            </a>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
