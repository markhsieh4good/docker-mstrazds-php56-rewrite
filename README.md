# on-board-php56-building-steps
my deploy steps

git clone https://github.com/mstrazds/nginx-php56.git
cd nginx-php56
vim Dockerfile
```
+ RUN apt-get install --no-install-recommends --no-install-suggests -y \
    wget \
    vim \
    net-tools \
    curl \
    supervisor \
    procps
+ RUN apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

```
