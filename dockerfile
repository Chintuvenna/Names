# Use the official Tomcat image from the Docker Hub
FROM tomcat:9.0

# Remove the default webapps included in the Tomcat image
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the webapps directory in Tomcat
COPY target/Names.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 to the outside world
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
