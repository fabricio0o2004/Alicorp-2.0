<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio de Sesión</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Montserrat y animaciones suaves -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

            body {
                margin: 0;
                font-family: 'Montserrat', sans-serif;
                background: linear-gradient(to bottom right, #FCE6E6, #F8D0D0); /* Fondo rosado suave */
                background-image: url('https://www.transparenttextures.com/patterns/cubes.png');
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .main-container {
                display: flex;
                width: 90%;
                max-width: 1000px;
                background: rgba(255, 255, 255, 0.75);
                backdrop-filter: blur(12px);
                border-radius: 20px;
                box-shadow: 0 25px 60px rgba(227, 6, 19, 0.15); /* Sombra rojiza */
                overflow: hidden;
                animation: fadeIn 1s ease-out;
            }

            .left-panel {
                background: linear-gradient(135deg, #E30613, #B2050F); /* Rojo institucional */
                color: #fff;
                flex: 1;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 50px;
                text-align: center;
            }

            .left-panel h1 {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 15px;
            }

            .left-panel p {
                font-size: 1rem;
                opacity: 0.9;
            }

            .left-panel img {
                max-width: 220px;
                margin-top: 30px;
                filter: drop-shadow(0 5px 10px rgba(0, 0, 0, 0.2));
            }

            .right-panel {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 40px;
            }

            .form-login {
                background: rgba(255, 255, 255, 0.96);
                padding: 30px;
                border-radius: 16px;
                width: 100%;
                max-width: 400px;
                box-shadow: 0 10px 30px rgba(227, 6, 19, 0.12);
            }

            .form-login h2 {
                color: #E30613;
                font-weight: 700;
                text-align: center;
                margin-bottom: 25px;
            }

            .form-floating .form-control {
                border-radius: 12px;
            }

            .form-floating .form-control:focus {
                border-color: #E30613;
                box-shadow: 0 0 6px rgba(227, 6, 19, 0.4);
            }

            .btn-primary {
                background-color: #E30613;
                border-color: #E30613;
                border-radius: 12px;
                font-weight: 600;
                transition: 0.3s;
            }

            .btn-primary:hover {
                background-color: #B2050F;
            }

            .password-toggle {
                cursor: pointer;
            }

            .text-danger {
                color: #B2050F !important;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @media (max-width: 768px) {
                .main-container {
                    flex-direction: column;
                }

                .left-panel {
                    order: 2;
                    padding: 30px;
                }

                .right-panel {
                    order: 1;
                    padding: 30px 15px;
                }
            }
        </style>

    </head>
    <body>
        <div class="main-container">
            <!-- PANEL IZQUIERDO -->
            <div class="left-panel">
                <h1>¡Bienvenido!</h1>
                <p>Accede con tus credenciales para continuar</p>
                <img src="imagenes/Login.png" alt="Logo Supermercado">
            </div>

            <!-- PANEL DERECHO -->
            <div class="right-panel">
                <div class="form-login">
                    <h2>Iniciar Sesión</h2>
                    <form action="${pageContext.request.contextPath}/ControlLogin" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtUsuario" id="txtUsuario" placeholder="Usuario" required>
                            <label for="txtUsuario">Usuario</label>
                        </div>
                        <div class="form-floating mb-3 position-relative">
                            <input type="password" class="form-control" name="txtClave" id="txtClave" placeholder="Contraseña" maxlength="30" required>
                            <label for="txtClave">Contraseña</label>
                            <i class="bi bi-eye-slash-fill position-absolute password-toggle" style="top: 50%; right: 15px; transform: translateY(-50%);" id="togglePassword"></i>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" name="validar" value="Aceptar">Ingresar</button>
                        </div>

                        <c:if test="${param.error == 1}">
                            <div class="text-center mt-3 text-danger">Usuario o clave incorrecta</div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const togglePassword = document.getElementById('togglePassword');
            const passwordField = document.getElementById('txtClave');

            togglePassword.addEventListener('click', function () {
                const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordField.setAttribute('type', type);
                this.classList.toggle('bi-eye');
                this.classList.toggle('bi-eye-slash-fill');
            });
        </script>
    </body>
</html>
