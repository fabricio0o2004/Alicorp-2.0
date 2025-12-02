<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<style>
    /* ------------------------------
       Estilos generales para Navbar
       ------------------------------ */
    .header-nav {
        background-color: #ffffff;
        border-bottom: 4px solid #D71920; /* Rojo Alicorp */
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }

    /* Texto del logo / menú principal */
    .color-logo {
        color: #D71920 !important;
        font-weight: 700;
    }

    /* Links del menú */
    .nav-link {
        color: #333 !important;
        font-weight: 600;
        transition: 0.3s ease;
        border-radius: 8px;
        padding: 8px 14px;
    }

    .nav-link:hover {
        background-color: #fbe5e6;  /* rojo muy suave */
        color: #D71920 !important;
    }

    /* Offcanvas */
    .offcanvas {
        background-color: #ffffff !important;
    }

    .offcanvas-header h5 {
        color: #D71920;
        font-weight: 700;
    }

    .btn-close-white {
        filter: invert(0); /* para que el botón se vea oscuro en fondo blanco */
    }

    /* ------------------------------
       Botón ?Mi Perfil?
       ------------------------------ */
    .btn-primary {
        background-color: #D71920 !important;
        border-color: #D71920 !important;
        font-weight: 600;
        border-radius: 12px;
        padding: 8px 18px;
    }

    .btn-primary:hover {
        background-color: #b9151b !important;
        border-color: #b9151b !important;
    }

    /* Dropdown */
    .dropdown-menu {
        border-radius: 12px;
        padding: 10px 0;
        border: 1px solid #f2d5d6;
    }

    .dropdown-item {
        font-weight: 600;
        color: #444 !important;
    }

    .dropdown-item:hover {
        background-color: #fbe5e6;
        color: #D71920 !important;
    }

    /* Cerrar sesión */
    .dropdown-item.text-danger {
        color: #D71920 !important;
        font-weight: 700;
    }

    .dropdown-item.text-danger:hover {
        background-color: #fbe5e6 !important;
    }

    /* ------------------------------
       Navbar Toggler (menú móvil)
       ------------------------------ */
    .navbar-toggler {
        border-color: #D71920;
        border-width: 2px;
    }

    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgb(215,25,32)' stroke-width='3' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
    }

    /* Espaciado del nav */
    .navbar-nav .nav-item {
        mamargin-right: 10px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-white bg-white p-3 header-nav">
    <div class="container-fluid px-3">
        <a href="" class="text-decoration-none color-logo pe-5">
            <h1 class="text-start color-logo fs-2">Menú Principal</h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar2" aria-controls="offcanvasNavbar2" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end text-bg-white" tabindex="-1" id="offcanvasNavbar2" aria-labelledby="offcanvasNavbar2Label">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbar2Label">Navegación</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1">
                    <c:if test="${sessionScope.usuAut.perfil == '1'}">
                        <li class="nav-item">
                            <a class="nav-link mx-1 my-1 fw-semibold" href="${pageContext.request.contextPath}/GestionUsuarios/menuGestionUsuarios.jsp">Gestión de Usuarios</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.usuAut.perfil == '1' or sessionScope.usuAut.perfil == '0'}">
                        <li class="nav-item">
                            <a class="nav-link mx-1 my-1" href="${pageContext.request.contextPath}/Productos/menuProductos.jsp">Producto</a>
                        </li>
                    </c:if>
                    <li class="nav-item dropdown mx-1 my-1">
                        <div class="btn-group btn-primary">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                Mi perfil
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end text-center">
                                <li>
                                    <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/CerrarSesion.jsp">
                                        <i class="bi bi-box-arrow-right me-1"></i> Cerrar Sesión
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
