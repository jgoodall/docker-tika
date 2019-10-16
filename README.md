# tika-server

This image starts a [Apache Tika Server](https://tika.apache.org/) on port 9998.

## Usage

To get started, run:

```docker run -p 9998:9998 jgoodall/tika```

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
