package conexion;

import entidad.Usuario;
import java.util.List;

public class DaoUsuario {

    public static List listar() {
        String sql = "SELECT codUsuario, username, nom, rol, est FROM t_usuario";
        return Acceso.listar(sql);
    }

    public static String actualizar(Usuario usu) {
        String sql = "UPDATE t_usuario SET "
                + "username='" + usu.getUsername() + "',"
                + "pass='" + usu.getPass() + "',"
                + "nom='" + usu.getNom() + "',"
                + "rol='" + usu.getPerfil() + "',"
                + "est='" + usu.getEst() + "' "
                + "WHERE codUsuario = '" + usu.getCodUsuario() + "'";
        System.out.println("Mensaje de dao actualizar: " + sql);
        return Acceso.ejecutar(sql);
    }

    public static Object[] buscar(String cod) {
        String sql = "SELECT codUsuario, username, nom, rol, est FROM t_usuario WHERE codUsuario = '" + cod + "'";
        return Acceso.buscar(sql);
    }
    
    public static Object[] buscarUsn(String usn) {
        String sql = "SELECT codUsuario, username, nom, rol, est FROM t_usuario WHERE username = '" + usn + "'";
        System.out.println(sql);
        return Acceso.buscar(sql);
    }

    public static String crear(Usuario usu) {
        String sql = "INSERT INTO t_usuario(username, pass, nom, rol, est) VALUES "
                + "('" + usu.getUsername() + "',"
                + "'" + usu.getPass() + "',"
                + "'" + usu.getNom() + "',"
                + "'" + usu.getPerfil() + "',"
                + "'1')";
        return Acceso.ejecutar(sql);
    }

    public static String eliminar(String cod) {
        String sql = "DELETE FROM t_usuario WHERE codUsuario = '" + cod + "'";
        return Acceso.ejecutar(sql);
    }
}
