FROM blog-node

# Set up user account for NodeBB.

RUN \
	useradd -ms /bin/bash user && \
	mkdir -p /opt/nodebb && \
	chown user:user /opt/nodebb

USER user

# Install NodeBB.
# Printing version info triggers installing dependencies
# without attempting to start the server yet.

RUN \
	git clone --branch v1.10.1 --depth 1 https://github.com/NodeBB/NodeBB.git /opt/nodebb && \
	cd /opt/nodebb && \
	./nodebb --version && \
	npm install nodebb-plugin-blog-comments

RUN \
	cd /opt/nodebb && npm install \
	nodebb-plugin-sso-google

# End installation.
