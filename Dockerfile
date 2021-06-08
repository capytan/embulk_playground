FROM openjdk:8-jre-alpine

# install Embulk
RUN wget -q https://dl.embulk.org/embulk-latest.jar -O /bin/embulk \
    && chmod +x /bin/embulk

# add plugin
RUN apk add --no-cache libc6-compat \
    && embulk gem install embulk-input-mysql \
    && embulk gem install embulk-output-postgresql

WORKDIR /embulk

ENTRYPOINT ["java", "-jar", "/bin/embulk"]