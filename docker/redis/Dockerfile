FROM blog-debian

# Set up repositories and install recent Redis.

RUN \
	echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main" > /etc/apt/sources.list.d/backports.list && \
	\
	apt-get update && \
	\
	apt-get install -y -t $(lsb_release -cs)-backports --no-install-recommends --no-install-suggests \
		redis-server

# End installation.
