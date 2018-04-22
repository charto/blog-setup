FROM blog-node

# Install ghost command line tools and set up user account.

RUN \
	npm install -g ghost-cli && \
	useradd -ms /bin/bash user && \
        mkdir -p /opt/ghost && \
        chown user:user /opt/ghost

USER user

# Install Ghost.

RUN \
	ghost install 1.22.3 \
	--db sqlite3 \
	--process local \
	--no-stack \
	--no-start \
	--no-prompt \
	--no-setup-nginx \
	--no-setup-migrate \
	--no-setup-linux-user \
	--url http://localhost:2368 \
	--dir /opt/ghost && \
	mv /opt/ghost/config.production.json /opt/ghost/config.original.json && \
	ln -s /opt/blog/ghost/config.json /opt/ghost/config.production.json

RUN \
	cp /opt/ghost/current/content/themes/casper/post.hbs /opt/ghost/current/content/themes/casper/post.hbs.original

COPY post.hbs /opt/ghost/current/content/themes/casper/post.hbs

# End installation.
