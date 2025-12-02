package controler;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class GenerarQR {

    public static void generar(String contenido, String ruta) {
        try {
            BitMatrix matrix = new MultiFormatWriter().encode(contenido, 
                    BarcodeFormat.QR_CODE, 300, 300);

            Path path = FileSystems.getDefault().getPath(ruta);
            MatrixToImageWriter.writeToPath(matrix, "PNG", path);

            System.out.println("QR generado en: " + ruta);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
