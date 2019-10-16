FROM openjdk:13-slim

ENV PORT 9998
ENV MEMORY 2g

ENV TIKA_VERSION 1.22
ENV TIKA_SERVER_URL https://www.apache.org/dist/tika/tika-server-$TIKA_VERSION.jar

RUN apt-get update && apt-get install -y --no-install-recommends \
 	  gnupg \
		curl \
		gdal-bin \
		tesseract-ocr \
		tesseract-ocr-eng \
		tesseract-ocr-ita \
		tesseract-ocr-fra \
		tesseract-ocr-spa \
		tesseract-ocr-deu \
	&& curl -sSL "$TIKA_SERVER_URL" -o /tika-server-${TIKA_VERSION}.jar \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE ${PORT}

ENTRYPOINT exec java -ms${MEMORY} -mx${MEMORY} -jar tika-server-${TIKA_VERSION}.jar --host 0.0.0.0 --log info --port ${PORT}