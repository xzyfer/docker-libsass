FROM alpine:3.1
ADD build.sh /usr/bin/
ENV LIBSASS_VERSION=3.2.0-beta.6 SASSC_VERSION=3.2.0-beta.6
RUN build.sh
ENTRYPOINT [ "sassc" ]
