package controler;

import entidad.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicio.ServicioUsuario;

@WebServlet(name = "ControlUsuario", urlPatterns = {"/ControlUsuario"})
public class ControlUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        System.out.println("Mensaje de get srvlet: " + op);

        switch (op) {
            case "Listar":
                List lista = ServicioUsuario.listarUsuario();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/GestionUsuarios/listadoUsuarios.jsp");
                break;
            case "Consultar":
                String cod = request.getParameter("cod");
                Usuario usu = ServicioUsuario.consultarUsuario(cod);
                request.getSession().setAttribute("usu", usu);
                System.out.println(usu.getPerfil());
                response.sendRedirect(request.getContextPath() + "/GestionUsuarios/actualizarUsuario.jsp");
                break;
            case "Nuevo":
                response.sendRedirect(request.getContextPath() + "/GestionUsuarios/registrarUsuario.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cod = request.getParameter("txtCod");
        String username = request.getParameter("txtUsn");
        String nom = request.getParameter("txtNom");
        String pass = request.getParameter("txtPass");
        String rol = request.getParameter("txtRol");
        String est = request.getParameter("selEst");

        String acc= request.getParameter("acc");
        String msg;
        List lista;

        switch (acc) {
            case "Crear":
                msg = ServicioUsuario.crearUsuario(username, nom, pass, rol);
                response.sendRedirect(request.getContextPath() + "/GestionUsuarios/registrarUsuario.jsp?msg=" + msg + "");
                break;
            case "Actualizar":
                msg = ServicioUsuario.actualizarUsuario(cod, username, nom, pass, rol, est);
                request.getSession().setAttribute("usu", ServicioUsuario.consultarUsuario(cod));
                response.sendRedirect(request.getContextPath() + "/GestionUsuarios/actualizarUsuario.jsp?msg=" + msg + "");
                break;
            case "Eliminar":
                msg = ServicioUsuario.eliminarUsuario(cod);
                lista = ServicioUsuario.listarUsuario();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/GestionUsuarios/listadoUsuarios.jsp?msg=" + msg + "");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
