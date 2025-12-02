
package conexion;

import entidad.Usuario;

public class DaoLogin {
    public static Object[] login(Usuario usu){
        String sql = "SELECT * FROM `t_usuario` WHERE username='"+usu.getUsername()+"' AND pass='"+usu.getPass()+"'";
        return Acceso.buscar(sql);
    }
}