package servicio;

import conexion.DaoUsuario;
import entidad.Usuario;
import java.util.ArrayList;
import java.util.List;

public class ServicioUsuario {

    public static List<Usuario> listarUsuario() {
        List lista = DaoUsuario.listar();
        List usuarios = new ArrayList();
        for (int i = 0; i < lista.size(); i++) {
            Object[] u = (Object[]) lista.get(i);
            Usuario usu = new Usuario(u[0].toString(),
                    u[1].toString(),
                    u[2].toString(),
                    (u[3] = "1".equals(u[3].toString()) ? "Administrador" : "Empleado").toString(),
                    (u[4] = "1".equals(u[4].toString()) ? "Activo" : "Inactivo").toString());
            usuarios.add(usu);
        }
        return usuarios;
    }

    public static String actualizarUsuario(String codUsu, String username, String nom, String pass, String rol, String est) {
        Usuario usu;
        if (pass == "") {
            usu = new Usuario(codUsu, username, nom, rol, est);
        } else {
            usu = new Usuario(codUsu, username, nom, pass, rol, est);
        }
        String msg = DaoUsuario.actualizar(usu);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }

    public static Usuario consultarUsuario(String codUsu) {
        Object[] u = DaoUsuario.buscar(codUsu);
        Usuario usu;
        if (u != null) {
            usu = new Usuario(u[0].toString(),
                    u[1].toString(),
                    u[2].toString(),
                    (u[3] = "1".equals(u[3].toString()) ? "Administrador" : "Empleado").toString(),
                    (u[4] = "1".equals(u[4].toString()) ? "Activo" : "Inactivo").toString());
        } else {
            usu = null;
        }
        return usu;
    }

    public static String crearUsuario(String username, String nom, String pass, String rol) {
        Usuario usu = new Usuario(username, nom, pass, rol);
        String msg = DaoUsuario.crear(usu);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }

    public static String eliminarUsuario(String codUsu) {
        String msg = DaoUsuario.eliminar(codUsu);
        if (msg == null) {
            msg = "2";
        }
        return msg;
    }
}
