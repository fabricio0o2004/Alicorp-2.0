<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.usuAut == null}">
    <c:redirect url="../login.jsp" />
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Actualizar Usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

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

    </head>
    <body>
        <%@ include file="../navbar.jsp" %>

        <header class="hero-header">
            <h1><i class="bi bi-pencil-square me-2"></i>Actualizar Usuario</h1>
        </header>
        <main class="form-container">
            <c:set var="u" value="${sessionScope.usu}"/>
            <form action="${pageContext.request.contextPath}/ControlUsuario" method="POST"> 

                <label for="txtCod">Código:</label>
                <input type="text" name="txtCod" value="${u.codUsuario}" readonly>

                <label for="selEst">Estado:</label>
                <select name="selEst">
                    <option value="1" <c:if test="${u.est == 'Activo'}">selected</c:if>>Activo</option>
                    <option value="0" <c:if test="${u.est == 'Inactivo'}">selected</c:if>>Inactivo</option>
                    </select>

                    <label for="txtUsn">Username:</label>
                    <input type="text" name="txtUsn" value="${u.username}" required>

                <label for="txtNom">Nombre completo:</label>
                <input type="text" name="txtNom" value="${u.nom}" required>

                <label for="txtPass">Contraseña:</label>
                <div class="form-control-password">
                    <input type="password" name="txtPass" id="txtPass" placeholder="">
                    <i class="bi bi-eye-slash toggle-password" id="togglePass"></i>
                </div>

                <label for="txtRol">Perfil:</label>
                <select name="txtRol">
                    <option value="0" <c:if test="${u.perfil == 'Empleado'}">selected</c:if>>Empleado</option>
                    <option value="1" <c:if test="${u.perfil == 'Administrador'}">selected</c:if>>Administrador</option>
                    </select>

                    <div class="d-flex justify-content-between">
                        <button class="btn btn-primary" type="submit" name="acc" value="Actualizar">
                            Guardar Cambios
                        </button>
                        <button class="btn btn-secondary" type="submit" name="acc" value="Eliminar">
                            Eliminar Usuario
                        </button>
                    </div>

                <c:if test="${param.msg == '1'}">
                    <div class="msg-success mt-4">
                        <i class="bi bi-check-circle-fill"></i> Usuario actualizado con éxito
                    </div>
                </c:if>

                <div class="text-center mt-4">
                    <c:url var="urlListar" value="/ControlUsuario"><c:param name="op" value="Listar"/></c:url>
                    <a href="${urlListar}" class="btn-back">
                        <i class="bi bi-arrow-left-circle"></i> Regresar al listado de usuarios
                    </a>
                </div>
            </form>
        </main>

        <script>
            const passwordInput = document.getElementById('txtPass');
            const toggleIcon = document.getElementById('togglePass');

            toggleIcon.addEventListener('click', () => {
                const type = passwordInput.type === 'password' ? 'text' : 'password';
                passwordInput.type = type;
                toggleIcon.classList.toggle('bi-eye');
                toggleIcon.classList.toggle('bi-eye-slash');
            });
        </script>

    </body>
</html>