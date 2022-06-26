FROM docker:git

RUN apk update -q && apk add -q --no-progress py-pip bash curl gcc python3-dev musl-dev libffi-dev && rm -rf /var/cache/apk/*
RUN pip install -q docker-compose
ADD https://github.com/git-lfs/git-lfs/releases/download/v3.2.0/git-lfs-linux-amd64-v3.2.0.tar.gz /tmp/
RUN cd /tmp/ && tar xzf git-lfs-linux-amd64-v3.2.0.tar.gz && cd git-lfs-3.2.0 && ./install.sh && cd .. && rm -rf git-*
RUN curl -L https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine \
	&& chmod +x /tmp/docker-machine \
	&& cp /tmp/docker-machine /usr/local/bin/docker-machine
