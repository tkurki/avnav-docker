FROM --platform=linux/arm64 debian:bullseye

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y \
wget \
gnupg

RUN wget -O - https://www.free-x.de/debian/oss.boating.gpg.key | gpg --dearmor | tee /usr/share/keyrings/oss.boating.gpg 
RUN echo "deb [signed-by=/usr/share/keyrings/oss.boating.gpg] https://www.free-x.de/debian bullseye main contrib non-free" | tee -a /etc/apt/sources.list.d/boating.list

RUN apt-get update 
RUN apt-get install -y avnav avnav-ocharts-plugin avnav-oesenc
