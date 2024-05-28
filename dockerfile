# Use the official Tomcat image from the Docker Hub
FROM tomcat:9.0

# Remove the default webapps included in the Tomcat image
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the webapps directory in Tomcat
COPY target/Names.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 to the outside world
EXPOSE 8080

# Copy the wait-for-it.sh script (if you need to wait for MySQL to be ready)
COPY wait-for-it.sh /usr/local/tomcat/bin/
RUN chmod +x /usr/local/tomcat/bin/wait-for-it.sh

# Start Tomcat using the wait-for-it.sh script to ensure MySQL is ready
CMD ["/usr/local/tomcat/bin/wait-for-it.sh", "db", "3306", "--", "catalina.sh", "run"]
