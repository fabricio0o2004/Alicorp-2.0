<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Información del Producto</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background: #F5F5F5; /* Fondo suave */
                padding: 20px;
            }

            .card {
                width: 480px;
                background: white;
                padding: 25px;
                margin: auto;
                border-radius: 12px;
                box-shadow: 0 0 14px rgba(0,0,0,0.12);
                border-top: 6px solid #E30613; /* Rojo Alicorp */
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #E30613; /* Rojo Alicorp */
                font-weight: bold;
            }

            .info {
                font-size: 18px;
                margin-bottom: 12px;
                color: #333;
            }

            .info span {
                font-weight: bold;
                color: #00843D; /* Verde institucional */
            }

            .qr-div {
                text-align: center;
                margin-top: 20px;
            }

            .btn {
                display: block;
                width: 100%;
                padding: 12px;
                margin-top: 25px;
                text-align: center;
                background: #E30613; /* Rojo Alicorp */
                color: white;
                text-decoration: none;
                border-radius: 6px;
                font-size: 16px;
                font-weight: bold;
                transition: 0.2s;
            }

            .btn:hover {
                background: #B2050F; /* Rojo más oscuro */
            }
        </style>

    </head>
    <body>

        <div class="card">
            <h2>Información del Producto</h2>

            <div class="info"><span>Código:</span> ${pro.codProducto}</div>
            <div class="info"><span>Nombre:</span> ${pro.nom}</div>
            <div class="info"><span>Lote:</span> ${pro.des}</div>
            <div class="info"><span>Fecha de Producción:</span> ${pro.pre}</div>
            <div class="info"><span>Fecha de Vencimiento:</span> ${pro.est}</div>
            <div class="info"><span>Ingredientes:</span> ${pro.nn}</div>

            <div class="qr-div">
                <h3>Código QR</h3>
                <img src="../QR/qr_${pro.codProducto}.png" width="220" height="220">
            </div>

            <a class="btn" href="listadoProductos.jsp">Volver al Listado</a>
        </div>

    </body>
</html>
