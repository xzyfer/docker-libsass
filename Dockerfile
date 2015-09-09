FROM alpine:3.1
ADD build.sh /usr/bin/
ENV LIBSASS_VERSION=3.2.5 SASSC_VERSION=3.2.5
RUN build.sh
ENTRYPOINT [ "sassc" ]
