FROM armv7/armhf-archlinux
MAINTAINER Gerard Ribas <gerard.ribas.canals@gmail.com>

ENV PACMAN_PACKAGES transmission-cli

RUN pacman -Sy --needed ${PACMAN_PACKAGES} --noconfirm

ENV RUN_USER   daemon
ENV RUN_GROUP  daemon

RUN chown -R ${RUN_USER}:${RUN_GROUP} /usr/bin/transmission-daemon \
    && chmod +x /usr/bin/transmission-daemon                       \
    && yes|pacman -Scc                                             \
    && rm -rf /usr/share/locale/*                                  \
    && rm -rf /usr/share/man/*                                     \
    && rm -rf /tmp/*

VOLUME /config
VOLUME /downloads

#Web Interface
EXPOSE 9091

#Port forwarding
EXPOSE 50001
EXPOSE 50001/udp

USER ${RUN_USER}:${RUN_GROUP}

CMD ["/usr/bin/transmission-daemon", "-f", "--no-portmap", "--config-dir", "/config/", "--log-info"]
