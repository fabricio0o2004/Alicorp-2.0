
package servicio;

import utilitarios.Encriptacion;
import conexion.DaoLogin;
import entidad.Usuario;

public class ServicioLogin {
    public static Usuario loginUsuario(String username, String pass){
        Usuario log = new Usuario(username, Encriptacion.encode(pass));
        Object[]ua = DaoLogin.login(log);
        Usuario usuAut;
        if (ua!=null) {
            usuAut = new Usuario(ua[1].toString(), ua[4].toString(), ua[5].toString());
        } else {
            usuAut = null;
        }
        return usuAut;
    }
}
