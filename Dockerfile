FROM alpine:3.6
COPY ./janus-pp-rec /usr/local/bin/janus-pp-rec
RUN apk update && apk add glib ffmpeg jansson && rm -rf /var/cache/apk/*
ENTRYPOINT ["janus-pp-rec"]

