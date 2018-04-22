FROM debian:stretch-slim

# Accelerate dpkg by disabling sync() and apt cache, see:
# https://github.com/docker/docker/issues/1458
# Then install https support for apt, needed by some repos.
# lsb-release provides distro codenames for defining repos.

RUN \
	echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
	echo 'Acquire::http {No-Cache=True;};' > /etc/apt/apt.conf.d/no-cache && \
	\
	apt-get update && \
	apt-get upgrade -y && \
	\
	apt-get install -y --no-install-recommends --no-install-suggests \
		apt-transport-https curl gnupg ca-certificates lsb-release

# End common Debian base installation.
