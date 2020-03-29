FROM ubuntu:18.04

WORKDIR /opt

RUN apt-get update && \
	apt-get install -y wget libluajit-5.1.2 libgl1-mesa-glx && \
	wget https://github.com/TES3MP/openmw-tes3mp/releases/download/0.7.0-alpha/tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz && \
    tar xfz tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-abc4090a0f-01d297f5c6.tar.gz

RUN touch /opt/TES3MP-server/tes3mp-server-default.cfg

ENTRYPOINT exec /opt/TES3MP-server/tes3mp-server
