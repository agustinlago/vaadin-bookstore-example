FROM registry.access.redhat.com/ubi9/openjdk-17

COPY . .

RUN mvn install -DskipTests

ENTRYPOINT [ "mvn", "jetty:run" , "-Pproduction" ]