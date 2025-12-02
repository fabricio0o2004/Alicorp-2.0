
package entidad;

public class Usuario {
    private String codUsuario;
    private String username;
    private String nom;
    private String pass;
    private String perfil;
    private String est;

    public Usuario() {

    }

    public Usuario(String codUsuario, String username, String nom, String pass, String perfil, String est) {
        this.codUsuario = codUsuario;
        this.username = username;
        this.nom = nom;
        this.pass = pass;
        this.perfil = perfil;
        this.est = est;
    }

    public Usuario(String codUsuario, String username, String nom, String perfil, String est) {
        this.codUsuario = codUsuario;
        this.username = username;
        this.nom = nom;
        this.perfil = perfil;
        this.est = est;
    }

    public Usuario(String username, String nom, String pass, String perfil) {
        this.username = username;
        this.nom = nom;
        this.pass = pass;
        this.perfil = perfil;
    }
    
    public Usuario(String username, String perfil, String est) {
        this.username = username;
        this.perfil = perfil;
        this.est = est;
    }

    public Usuario(String username, String pass) {
        this.username = username;
        this.pass = pass;
    }
    
    public String getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(String codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    @Override
    public String toString() {
        return "Usuario{" + "codUsuario=" + codUsuario + ", username=" + username + ", nom=" + nom + ", pass=" + pass + ", perfil=" + perfil + ", est=" + est + '}';
    }

    public String getUsuario() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
