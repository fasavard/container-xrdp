# https://github.com/danchitnis/container-xrdp

FROM mottosso/maya:2022

RUN yum -y update

RUN yum install -y epel-release

RUN yum -y groups install "MATE Desktop"

RUN bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop'

RUN yum install -y xrdp xorgxrdp

RUN yum -y install sudo nload passwd nano

RUN yum -y install pluma caja-open-terminal

COPY /build/xrdp.ini /etc/xrdp/
COPY /build/startwm-mate.sh /etc/xrdp/

RUN mv /etc/xrdp/startwm-mate.sh /etc/xrdp/startwm.sh

COPY /build/run.sh /
RUN chmod +x /run.sh

EXPOSE 3389

ENTRYPOINT ["/run.sh"]

