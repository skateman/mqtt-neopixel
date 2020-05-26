ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /opt/mqtt-neopixel

COPY requirements.txt .
COPY app.py .

RUN apk add --no-cache --virtual .build-dependencies make gcc musl-dev linux-headers && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apk del --no-cache --purge .build-dependencies

CMD [ "python3", "app.py" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64"
