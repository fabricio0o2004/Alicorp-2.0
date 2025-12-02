# Usamos una imagen de Tomcat con Java
FROM tomcat:9-jdk11-openjdk

# Borramos la app de bienvenida que trae Tomcat por defecto
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiamos TU archivo .war a la carpeta de apps de Tomcat
# NOTA: Asegúrate de que la ruta 'dist/ROOT.war' coincida con donde está tu archivo
COPY ./dist/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Abrimos el puerto 8080 (el estándar de Tomcat)
EXPOSE 8080

# Arrancamos Tomcat
CMD ["catalina.sh", "run"]