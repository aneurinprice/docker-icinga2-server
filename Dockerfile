FROM alpine:3.12.1
LABEL maintainer="Aneurin Price adp@nyeprice.space"

# Sets default to Disk, Most people will want this
ENV CONFIG_MODE=Disk

# Install Packages
RUN apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/main" \
	acl \
	bash \
	git \
	icinga2 \
	openssh \	
	sudo; \
  # Add Group
  addgroup \
	icinga2-user; \
  # Add User
  adduser \
    --disabled-password \
    --gecos "" \
    --home /home/icinga2-user \
    --ingroup icinga2-user \
    --uid 6969 \
    icinga2-user; \
  # Configure SUDO
  echo "icinga2-user ALL=(ALL) NOPASSWD: /usr/lib/icinga2/prepare-dirs, /usr/sbin/icinga2 *" > /etc/sudoers.d/icinga2-user; \
  # Empty /etc/icinga2
  rm -rf /etc/icinga2/*; \
  # Change ownership of /etc/icinga2 (This is due to setfacl behavior between dockerfile and running. Will look into this later)
  chown icinga2-user /etc/icinga2

WORKDIR /home/icinga2-user

USER icinga2-user 

EXPOSE 5665

HEALTHCHECK  CMD stat /run/icinga2/icinga2.pid

COPY entrypoint.d/ /entrypoint.d
ENTRYPOINT [ "/bin/run-parts", "--exit-on-error", "/entrypoint.d" ]
