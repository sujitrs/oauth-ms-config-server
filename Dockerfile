FROM openjdk:latest
VOLUME /tmp
VOLUME E:/_fsconfig/ /_fsconfig/
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","-Dspring.profiles.active=native","org.sj.msconfigserver.MsConfigServerApplication"]