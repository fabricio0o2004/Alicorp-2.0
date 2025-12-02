<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Actualizar Producto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Estilos y fuentes -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Quicksand', sans-serif;
                background: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'),
                    linear-gradient(to right, #FCE6E6, #F9D2D2); /* Fondo suave rojo */
                background-blend-mode: soft-light;
                min-height: 100vh;
                padding: 0;
                margin: 0;
            }

            .hero-header {
                background: linear-gradient(to right, #E30613, #B2050F); /* Rojo Alicorp */
                color: white;
                padding: 40px 20px;
                text-align: center;
                font-weight: bold;
            }

            .form-container {
                background: #ffffffee;
                max-width: 800px;
                margin: -30px auto 40px auto;
                padding: 2rem;
                border-radius: 1rem;
                box-shadow: 0 8px 24px rgba(227, 6, 19, 0.20); /* sombra rojiza */
                border-left: 6px solid #E30613;  /* detalle corporativo */
            }

            .form-label {
                font-weight: 600;
                color: #B2050F; /* Rojo suave en labels */
            }

            .btn-custom {
                border-radius: 25px;
                padding: 8px 20px;
                font-weight: 600;
                background-color: #E30613;  /* Botón rojo */
                color: white;
                border: none;
                transition: 0.3s;
            }

            .btn-custom:hover {
                background-color: #B2050F; /* Hover */
                transform: translateY(-2px);
            }

            .text-success {
                font-weight: bold;
                color: #00843D !important; /* Verde corporativo */
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

        <!-- Validación JS -->
        <script>
            function validarNumeroInput(e) {
                const charCode = e.which ? e.which : e.keyCode;
                if (
                        (charCode < 48 || charCode > 57) && // no es número
                        charCode !== 46 // excepto punto
                        ) {
                    e.preventDefault();
                }
            }

            function soloNumerosPuros(e) {
                const charCode = e.which ? e.which : e.keyCode;
                if (charCode < 48 || charCode > 57) {
                    e.preventDefault();
                }
            }

            document.addEventListener("DOMContentLoaded", () => {
                const precio = document.getElementById("txtPre");
                if (precio) {
                    precio.addEventListener("keypress", validarNumeroInput);
                }
            });
        </script>
    </head>

    <body>
        <%@ include file="../navbar.jsp" %>

        <header class="hero-header">
            <h1><i class="bi bi-pencil-square me-2"></i>Actualizar Producto</h1>
        </header>

        <main class="form-container">
            <c:set var="p" value="${sessionScope.pro}" />
            <form action="${pageContext.request.contextPath}/ControlProducto" method="POST">
                <div class="mb-3">
                    <label for="txtCod" class="form-label">ID:</label>
                    <input type="text" class="form-control" name="txtCod" id="txtCod" value="${p.codProducto}" readonly>
                </div>

                <div class="mb-3">
                    <label for="txtEst" class="form-label">Nombre:</label>
                    <input type="text" class="form-control" name="txtNom" id="txtNom" value="${p.nom}" required>
                </div>

                <div class="mb-3">
                    <label for="txtEst" class="form-label">Lote:</label>
                    <input type="text" class="form-control" name="txtDes" id="txtDes" value="${p.des}" required>
                </div>

                <div class="mb-3">
                    <label for="txtNom" class="form-label">Fecha de producción:</label>
                    <input type="date" class="form-control" name="txtPre" id="txtPre" value="${p.pre}" required>
                </div>

                <div class="mb-3">
                    <label for="txtDes" class="form-label">Fecha de vencimiento:</label>
                    <input type="date" class="form-control" name="txtEst" id="txtEst" value="${p.est}" required>
                </div>

                <div class="mb-3">
                    <label for="txtPre" class="form-label">Ingredientes:</label>
                    <input type="text" class="form-control" name="txtNn" id="txtNn" value="${p.nn}" required>
                </div>

                <img src="${pageContext.request.contextPath}/QR/qr_${pro.codProducto}.png" 
                     alt="QR del producto" width="180px">

                <div class="d-flex justify-content-between">
                    <button class="btn btn-success btn-custom" type="submit" name="acc" value="Actualizar">
                        <i class="bi bi-check-circle me-1"></i>Guardar cambios
                    </button>
                    <button class="btn btn-danger btn-custom" type="submit" name="acc" value="Eliminar">
                        <i class="bi bi-trash me-1"></i>Eliminar producto
                    </button>
                </div>

                <c:if test="${param.msg == '1'}">
                    <div class="text-success text-center mt-4">Producto actualizado con éxito</div>
                </c:if>

                <div class="text-center mt-4">
                    <c:url var="urlListar" value="/ControlProducto">
                        <c:param name="op" value="Listar"/>
                    </c:url>
                    <a href="${urlListar}" class="btn btn-outline-secondary btn-custom">
                        <i class="bi bi-arrow-left-circle me-1"></i>Volver al listado de productos
                    </a>
                </div>
            </form>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
