FROM nginx:alpine

LABEL maintainer="chandan009s"
LABEL version="1.0"
LABEL description="Tetris game - cloud native pipeline demo"

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/ || exit 1
