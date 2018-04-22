#!/bin/sh
openssl req -x509 -sha256 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 65535 -subj "/C=XX/ST=-/L=-/O=-/OU=-/CN=localhost"
