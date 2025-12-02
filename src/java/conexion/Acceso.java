package conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Acceso {

    public static Connection getConexion() {
        Connection cn;
        try {
            // 1. Usamos el driver moderno (com.mysql.cj.jdbc.Driver) 
            // Si te da error, cambia 'cj.jdbc' por 'jdbc' como tenías antes.
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. TUS DATOS DE CLEVER CLOUD
            String host = "bsvf2yqpqc3bcq5h0pob-mysql.services.clever-cloud.com";
            String db = "bsvf2yqpqc3bcq5h0pob"; // El nombre raro de la BD
            String user = "u2l242gwiurwaggy";
            String pass = "USYdEgKrchPfvHMHxVXv"; // <--- ¡PEGA TU CONTRASEÑA AQUÍ!

            // 3. URL con parámetros para evitar errores de SSL y zona horaria en la nube
            String url = "jdbc:mysql://" + host + ":3306/" + db + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

            cn = DriverManager.getConnection(url, user, pass);
            
            // Mensaje opcional para saber si conectó al ejecutar
            System.out.println("--- Conexión a Clever Cloud EXITOSA ---");

        } catch (ClassNotFoundException e) {
            System.out.println("Error Driver: " + e.getMessage());
            cn = null;
        } catch (SQLException e) {
            System.out.println("Error SQL: " + e.getMessage());
            cn = null;
        }
        return cn;
    }

    public static String ejecutar(String sql) {
        String msg = null;
        try {
            Connection cn = getConexion();
            if (cn == null) {
                msg = "No hay Conexion con la Base de Datos";
            } else {
                Statement st = cn.createStatement();
                st.executeUpdate(sql);
                cn.close();
            }
        } catch (SQLException e) {
            msg = e.getMessage();
        }
        return msg;
    }

    public static List listar(String sql) {
        List lista = new ArrayList();
        try {
            Connection cn = getConexion();
            if (cn == null) {
                lista = null;
            } else {
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                ResultSetMetaData rm = rs.getMetaData();
                int numCol = rm.getColumnCount();
                while (rs.next()) {
                    Object[] fila = new Object[numCol];
                    for (int i = 0; i < numCol; i++) {
                        fila[i] = rs.getObject(i + 1);
                    }
                    lista.add(fila);
                }
                cn.close();
            }
        } catch (SQLException e) {
            lista = null;
        }
        return lista;
    }

    public static Object[] buscar(String sql) {
        Object[] fila = null;
        List lista = listar(sql);
        if (lista != null) {
            for (int i = 0; i < lista.size(); i++) {
                fila = (Object[]) lista.get(i);
            }
        }
        return fila;
    }

    public static String getNum(String sql) {
        String numGen;
        String numObt = null;
        try {
            Connection cn = getConexion();
            if (cn == null) {
                numGen = null;
            } else {
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    numObt = rs.getString(1);
                }
                // Validación extra por si la tabla está vacía y numObt es null
                if (numObt == null) {
                    // Retorna un valor inicial si no hay registros
                    // Ajusta esto según el formato de tu ID (ej: P00001)
                    return "P00001"; 
                }

                String parInt = numObt.substring(2);
                String parStr = numObt.substring(0, 1); // Ojo: P00001 -> P (index 0,1) y 0001. Revisa tus índices si falla.
                String nueParInt = String.valueOf(Integer.parseInt(parInt) + 1);
                while (nueParInt.length() < 5) {
                    nueParInt = "0" + nueParInt;
                }
                numGen = parStr + nueParInt;
            }
        } catch (SQLException e) {
            numGen = null;
            System.out.println("Error en getNum: " + e.getMessage());
        }
        return numGen;
    }
}