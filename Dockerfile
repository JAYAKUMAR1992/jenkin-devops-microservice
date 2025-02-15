FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8000
ADD target/*.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

# Install ca-certificates
# Please locate cert_file_name.crt file in the same directory as Dockerfile.
COPY cert_file_name.crt /usr/share/ca-certificates/
RUN echo cert_file_name.crt >> /etc/ca-certificates.conf
RUN update-ca-certificates