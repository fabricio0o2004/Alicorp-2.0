package servicio;

import controler.GenerarQR;
import conexion.DaoProducto;
import entidad.Producto;
import java.util.ArrayList;
import java.util.List;
import utilitarios.Utiles;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import java.io.File;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

public class ServicioProducto {

    public static List<Producto> listarProducto() {
        List lista = DaoProducto.listar();
        List productos = new ArrayList();
        for (int i = 0; i < lista.size(); i++) {
            Object[] p = (Object[]) lista.get(i);
            Producto pro = new Producto(
                    p[0].toString(),
                    p[1].toString(),
                    p[2].toString(),
                    p[3].toString(),
                    p[4].toString(),
                    p[5].toString());
            productos.add(pro);
        }
        return productos;
    }

    public static String actualizarProducto(String codPro, String nom, String des, String pre, String est, String nn) {
        Producto pro = new Producto(codPro, nom, des, pre, est, nn);
        String msg = DaoProducto.actualizar(pro);
        if (msg == null) {
            msg = "1";
        }
        return msg;
    }

    public static Producto consultarProducto(String codPro) {
        Object[] p = DaoProducto.buscar(codPro);
        Producto pro;
        if (p != null) {
            pro = new Producto(
                    p[0].toString(),
                    p[1].toString(),
                    p[2].toString(),
                    p[3].toString(),
                    p[4].toString(),
                    p[5].toString());
        } else {
            pro = null;
        }
        return pro;
    }

    public static String crearProducto(String nom, String des, String pre, String est, String nn) {

        List lista = DaoProducto.ultCod();
        Object[] ultCod = (Object[]) lista.get(0);

        String codProducto = Utiles.newCod(ultCod[0].toString());

        Producto pro = new Producto(codProducto, nom, des, pre, est, nn);

        String msg = DaoProducto.crear(pro);
        if (msg == null) {
            msg = "1";
        }

        return msg;
    }

    public static void generarQR(String texto, String ruta) {
        try {
            int tamaño = 300;
            BitMatrix matrix = new MultiFormatWriter().encode(
                    texto,
                    BarcodeFormat.QR_CODE,
                    tamaño,
                    tamaño
            );
            Path path = java.nio.file.FileSystems.getDefault().getPath(ruta);
            MatrixToImageWriter.writeToPath(matrix, "PNG", path);
        } catch (Exception e) {
            System.out.println("Error generando QR: " + e.getMessage());
        }
    }

    public static String ultimoCodigoGenerado() {
        List lista = DaoProducto.ultCod();
        Object[] fila = (Object[]) lista.get(0);
        return fila[0].toString();
    }

    public static String eliminarProducto(String cod) {
        String msg = DaoProducto.eliminar(cod);
        if (msg == null) {
            msg = "2";
        }
        return msg;
    }
}
