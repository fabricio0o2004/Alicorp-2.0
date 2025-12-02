package entidad;

public class Producto {
    private String codProducto;
    private String nom;
    private String des;
    private String pre;
    private String est;
    private String nn;

    public Producto(String codProducto, String nom, String des, String pre, String est, String nn) {
        this.codProducto = codProducto;
        this.nom = nom;
        this.des = des;
        this.pre = pre;
        this.est = est;
        this.nn = nn;
    }
    
    public Producto() {
    }
    
    public String getCodProducto() {
        return codProducto;
    }

    public void setCodProducto(String codProducto) {
        this.codProducto = codProducto;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getPre() {
        return pre;
    }

    public void setPre(String pre) {
        this.pre = pre;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    
     public String getNn() {
        return nn;
    }

    public void setNn(String nn) {
        this.nn = nn;
    }

    @Override
    public String toString() {
        return "Producto{" + "codProducto=" + codProducto + ", nom=" + nom + ", des=" + des + ", pre=" + pre + ", est=" + est +", nn=" + nn + '}';
    }  
}
