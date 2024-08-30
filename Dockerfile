FROM ubuntu:jammy
ARG DOCKER_USER

# Install PacketTracer
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND teletype
COPY Packet_Tracer822_amd64_signed.deb /tmp/
RUN apt-get install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
RUN yes yes | apt install -y /tmp/Packet_Tracer822_amd64_signed.deb

# Add a non-root user
RUN useradd $DOCKER_USER
USER $DOCKER_USER

# This sets the user's home owned by DOCKER_USER (owned by root otherwise)
WORKDIR /home/${DOCKER_USER}

CMD ["packettracer"]

