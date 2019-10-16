# tika-server

This image starts a [Apache Tika Server](https://tika.apache.org/).

To see the version of Apache Tika, see `ENV TIKA_VERSION` in `Dockerfile`.

## Usage

To get started using the default port to listen on, run:

```docker run -p 9998:9998 jgoodall/tika```

To change the port and/or memory allocation to listen on, run:

```docker run --env PORT=9123 --env MEMORY=4g -p 9123:9123 jgoodall/tika```

## Docker

To build and push the image to docker hub:

```sh
VERS=v0.0.1
git tag -a $VERS
docker build -t jgoodall/tika:latest .
docker push jgoodall/tika:latest
docker build -t jgoodall/tika:$VERS .
docker push jgoodall/tika:$VERS
```
