package utilitarios;

public class Utiles {

    public static String newCod(String pCodigo) {
        System.out.println("Código ingresante: " + pCodigo);
        char letraInicial = pCodigo.charAt(0);
        int numero = Integer.parseInt(pCodigo.substring(1));
        numero = numero + 1;
        String numeroFormateado = String.format("%05d", numero);
        String nuevoCodigo = letraInicial + numeroFormateado;
        System.out.println("Código convertido en Utiles newCod: " + nuevoCodigo);
        return nuevoCodigo;
    }
}
