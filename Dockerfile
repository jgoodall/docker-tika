FROM openjdk:13-slim

# RUNTIME ENVIRONMENT VARIABLES THAT CAN BE OVERRIDDEN USING:
# docker run --env KEY=VAL
ENV PORT 9998
ENV MEMORY 1g

EXPOSE ${PORT}

ENV TIKA_VERSION 1.22
ENV TIKA_SERVER_URL https://www.apache.org/dist/tika/tika-server-$TIKA_VERSION.jar
RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		gdal-bin \
		tesseract-ocr \
		tesseract-ocr-eng \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -sSL "$TIKA_SERVER_URL" -o /tika-server.jar

ENTRYPOINT exec java -Xms${MEMORY} -Xmx${MEMORY} -jar tika-server.jar --host 0.0.0.0 --log info --port ${PORT}