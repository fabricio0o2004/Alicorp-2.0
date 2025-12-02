<%-- 
    Document   : ErrorLogin
    Created on : 1 jun. 2025, 21:08:31
    Author     : Usuario local
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Fallido</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5 text-center">
        <div class="alert alert-danger">
            <h4 class="alert-heading">Acceso denegado</h4>
            <p>Usuario o clave incorrectos. Por favor, inténtalo de nuevo.</p>
            <hr>
            <a href="login.jsp" class="btn btn-danger">Volver al Login</a>
        </div>
    </div>
</body>
</html>
