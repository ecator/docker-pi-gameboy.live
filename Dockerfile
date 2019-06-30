# Set base image
FROM balenalib/raspberrypi3-golang:latest

# Define working directory.
WORKDIR /tmp

# Build
RUN \
	git clone https://github.com/HFO4/gameboy.live.git \
	&& cd gameboy.live \
	&& go build -o gbdotlive main.go \
	&& mv gbdotlive /usr/bin/ \
	# Cleanup
	&& rm -rf /tmp/* /tmp/.[!.]*

# Install dependencies

# Add files.
COPY /startapp.sh /

# Define mountable directories.
VOLUME ["/data"]

# Expose ports
#	- 1989 custom telnet port for the gameboy emulator
EXPOSE 1989

# Metadata.
LABEL \
	org.label-schema.name="gb.live" \
	org.label-schema.description="Docker container pi for gb.live Gameboy telnet emulator." \
	org.label-schema.version="unknown" \
	org.label-schema.vcs-url="https://github.com/ecator/docker-pi-gameboy.live" \
	org.label-schema.schema-version="1.0" \
	maintainer="Martin Qu <qule520@126.com>"

ENTRYPOINT ["/bin/sh", "-c", "/startapp.sh"]
