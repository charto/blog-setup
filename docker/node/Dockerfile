FROM blog-debian

# Set up repositories and install recent Node.js.

RUN \
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - && \
	\
	echo "deb https://deb.nodesource.com/node_8.x $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list && \
	echo "deb-src https://deb.nodesource.com/node_8.x $(lsb_release -cs) main" >> /etc/apt/sources.list.d/nodesource.list && \
	\
	apt-get update && \
	\
	apt-get install -y --no-install-recommends --no-install-suggests \
		nodejs

# End installation needed for production use.

# Begin installation needed for development and initial setup.

# Install C++ toolchain needed for compiling native Node.js addons.

RUN \
	apt-get install -y --no-install-recommends --no-install-suggests \
		build-essential \
		python

# Install some commands for scripting and convenience.

RUN \
	apt-get install -y --no-install-recommends --no-install-suggests \
		git \
		less \
		procps \
		nano

# End installation.
