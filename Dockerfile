FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y git maven tomcat9
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
RUN ln -s /etc/tomcat9 /usr/share/tomcat9/conf
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]