FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y git maven tomcat9
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 80
CMD ["catalina.sh", "run"]