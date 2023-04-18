FROM --platform=linux/arm64 debian:bullseye

COPY files .

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y python3-bluez \
python3-pyudev \
python3-serial \
python3-gdal \
python3-netifaces \
python3-pil \
python3-pigpio \
gnupg

RUN apt-key add - < ./oss.boating.gpg.key
RUN mv oss.boating.gpg /usr/share/keyrings/

RUN \
echo '#deb [signed-by=/usr/share/keyrings/oss.boating.gpg] https://www.free-x.de/debpreview bullseye main contrib non-free' >/etc/apt/sources.list.d/bullseye-extra.list && \
echo 'deb [signed-by=/usr/share/keyrings/oss.boating.gpg] https://www.free-x.de/debian bullseye main contrib non-free' >/etc/apt/sources.list.d/bullseye-extra.list
RUN apt-get update 
RUN apt-get install -y avnav-ocharts-plugin
