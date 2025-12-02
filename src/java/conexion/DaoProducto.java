package conexion;

import entidad.Producto;
import java.util.ArrayList;
import java.util.List;

public class DaoProducto {

    public static List listar() {
        String sql = "SELECT * FROM t_producto ORDER BY Id_Prod ASC";
        List lista = Acceso.listar(sql);
        if (lista == null) {
            lista = new ArrayList();
        }
        return lista;
    }

    public static String actualizar(Producto pro) {
        String sql = "UPDATE t_producto SET "
                + "nombre='" + pro.getNom() + "',"
                + "lote='" + pro.getDes() + "',"
                + "fecha_prod='" + pro.getPre() + "',"
                + "fecha_ven='" + pro.getEst() + "',"
                + "ingredientes='" + pro.getNn() + "'"
                + "WHERE Id_Prod = '" + pro.getCodProducto() + "'";
        return Acceso.ejecutar(sql);
    }

    public static Object[] buscar(String codPro) {
        String sql = "SELECT * FROM t_producto WHERE Id_Prod = '" + codPro + "'";
        return Acceso.buscar(sql);
    }

    public static String crear(Producto pro) {
        String sql = "INSERT INTO t_producto(Id_Prod, nombre, lote, fecha_prod, fecha_ven, ingredientes) VALUES "
                + "('" + pro.getCodProducto() + "',"
                + "'" + pro.getNom() + "',"
                + "'" + pro.getDes() + "',"
                + "'" + pro.getPre() + "',"
                + "'" + pro.getEst() + "',"
                + "'" + pro.getNn() + "')";
        return Acceso.ejecutar(sql);
    }

    public static List ultCod() {
        String sql = "SELECT MAX(Id_Prod) Id_Prod FROM t_producto";
        return Acceso.listar(sql);
    }

    public static String eliminar(String cod) {
        String sql = "DELETE FROM t_producto WHERE Id_Prod = '" + cod + "'";
        return Acceso.ejecutar(sql);
    }
}
