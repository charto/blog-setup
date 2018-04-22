FROM blog-debian

# Set up repositories and install recent NGINX.

RUN \
	curl -fsSL https://nginx.org/keys/nginx_signing.key | \
	APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - && \
	\
	echo "deb http://nginx.org/packages/debian/ $(lsb_release -cs) nginx" > /etc/apt/sources.list.d/nginx.list && \
	echo "deb-src http://nginx.org/packages/debian/ $(lsb_release -cs) nginx" >> /etc/apt/sources.list.d/nginx.list && \
	\
	apt-get update && \
	\
	apt-get install -y --no-install-recommends --no-install-suggests \
		nginx

# End installation.
