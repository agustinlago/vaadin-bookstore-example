FROM registry.access.redhat.com/ubi9/openjdk-17

WORKDIR /deployments

COPY . .
USER root
RUN mvn install -DskipTests -Pproduction
RUN chown -R default /deployments
USER default

ENTRYPOINT [ "mvn", "jetty:run" ]