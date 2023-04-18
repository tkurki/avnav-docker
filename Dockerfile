FROM debian:bullseye

COPY files .

RUN apt-get update
RUN apt-get install -y python3-bluez \
python3-pyudev \
python3-serial \
python3-gdal \
python3-netifaces \
python3-pil \
python3-pigpio \
gnupg

RUN apt-key add - < ./oss.boating.gpg.key && \
echo 'deb https://www.free-x.de/debian bullseye main contrib non-free' >/etc/apt/sources.list.d/avnav.list && \
echo '#deb https://open-mind.space/repo/ bullseye-stable avnav' >>/etc/apt/sources.list.d/avnav.list && \
echo '#deb https://open-mind.space/repo/ bullseye-daily avnav' >>/etc/apt/sources.list.d/avnav.list && \
apt-get update
RUN apt-get install -y avnav
ENTRYPOINT [ "/usr/bin/avnav" ]
