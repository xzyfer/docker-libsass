FROM alpine:3.1
ADD build.sh /usr/bin/
RUN CACHE_BUSTER=3.2.0-beta.5 build.sh
ENTRYPOINT [ "sassc" ]
