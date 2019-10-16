# tika-server

This image starts a [Apache Tika Server](https://tika.apache.org/) for text extraction (English only).

To see the version of Apache Tika, see `ENV TIKA_VERSION` in `Dockerfile`.

## Usage

To get started using the default port to listen on, run:

```docker run -p 9998:9998 jgoodall/tika```

To change the port and/or memory allocation (default is `1g`), run:

```docker run --env PORT=9123 --env MEMORY=4g -p 9123:9123 jgoodall/tika```

To test, send a document to the server:

```sh
curl -H "Accept: application/json" -T testfile.pdf http://localhost:9998/meta
```

## Build Docker Image

To build and push the image to docker hub:

```sh
VERS=v0.1.3
git tag -a $VERS
git push --tag
docker build -t jgoodall/tika -t jgoodall/tika:$VERS .
docker push jgoodall/tika
docker push jgoodall/tika:$VERS
```
