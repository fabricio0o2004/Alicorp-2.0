package controler;

import entidad.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicio.ServicioProducto;

@WebServlet(name = "ControlProducto", urlPatterns = {"/ControlProducto"})
public class ControlProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        System.out.println("Mensaje de get srvlet doGet: " + op);

        switch (op) {
            case "Listar":
                List lista = ServicioProducto.listarProducto();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/Productos/listadoProductos.jsp");
                break;
            case "Consultar":
                String cod = request.getParameter("cod");
                Producto pro = ServicioProducto.consultarProducto(cod);
                System.out.println(pro.toString());
                request.getSession().setAttribute("pro", pro);
                response.sendRedirect(request.getContextPath() + "/Productos/actualizarProducto.jsp");
                break;
            case "Nuevo":
                response.sendRedirect(request.getContextPath() + "/Productos/registrarProducto.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("txtCod");
        String nom = request.getParameter("txtNom");
        String des = request.getParameter("txtDes");
        String pre = request.getParameter("txtPre");
        String est = request.getParameter("txtEst");
        String nn = request.getParameter("txtNn");

        String acc = request.getParameter("acc");
        String msg;
        List lista;
        System.out.println("Mensaje del servlet doPost acc: " + acc);
        switch (acc) {
            case "Crear":
                msg = ServicioProducto.crearProducto(nom, des, pre, est, nn);

                // OBTENER EL CÓDIGO RECIÉN CREADO
                String codGenerado = ServicioProducto.ultimoCodigoGenerado();

                // RUTA REAL DEL ARCHIVO QR
                String rutaQR = getServletContext().getRealPath("/QR/qr_" + codGenerado + ".png");

                // CONTENIDO DEL QR
                String contenidoQR = "http://192.168.101.7:8080/Escanear/verProductos.jsp?op=Consultar&cod=" + codGenerado;


                // GENERAR QR
                try {
                    controler.GenerarQR.generar(contenidoQR, rutaQR);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // REDIRECCIONA DESPUÉS DE GENERAR EL QR
                response.sendRedirect(request.getContextPath() + "/Productos/registrarProducto.jsp?msg=" + msg);
                break;

            case "Actualizar":
                msg = ServicioProducto.actualizarProducto(cod, nom, des, pre, est, nn);
                request.getSession().setAttribute("pro", ServicioProducto.consultarProducto(cod));
                response.sendRedirect(request.getContextPath() + "/Productos/actualizarProducto.jsp?msg=" + msg + "");
                break;
            case "Eliminar":
                msg = ServicioProducto.eliminarProducto(cod);
                lista = ServicioProducto.listarProducto();
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect(request.getContextPath() + "/Productos/listadoProductos.jsp?msg=" + msg + "");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

