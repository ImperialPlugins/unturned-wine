FROM ubuntu:16.04
RUN mkdir -p /home/root
ENV HOME /home/root
WORKDIR /home/root

ENV WINEPREFIX /home/root/.wine
ENV WINEARCH win32
ENV WINEDEBUG -all
ENV DEBIAN_FRONTEND noninteractive
ENV GAME_INSTALL_DIR /home/root/.wine/drive_c/users/root/DedicatedServer
ENV GAME_ID 304930

EXPOSE 27015
EXPOSE 27016

# Copy scripts
COPY . .

# Set permissions
RUN chmod +x install.sh
RUN chmod +x init.sh
RUN chmod +x start_gameserver.sh

# Installs Prerequisites, Wine and Steam CMD
RUN	./install.sh

# Install / Update game and start server
ENTRYPOINT ["./init.sh"]