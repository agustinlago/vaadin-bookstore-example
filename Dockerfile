FROM registry.access.redhat.com/ubi9/openjdk-17

WORKDIR /deployments

COPY . .
USER root
RUN mvn install -DskipTests
RUN chmod -R 777 /deployments
USER default

ENTRYPOINT [ "mvn", "jetty:run" , "-Pproduction" ]