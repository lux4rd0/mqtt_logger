FROM grafana/promtail:2.5.0

RUN apt-get update && apt-get install -y dumb-init mosquitto-clients vim

RUN mkdir /mqtt-logger

COPY config.yaml /mqtt-logger
COPY start.sh /mqtt-logger

WORKDIR /mqtt-logger

RUN chmod a+x *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/mqtt-logger/start.sh"]

ENV MQTT_LOGGER_LOKI_CLIENT_URL=http://loki:3100/loki/api/v1/push MQTT_LOGGER_LOKI_TENANT_ID=test MQTT_LOGGER_MQTT_HOSTNAME=mqtt MQTT_LOGGER_MQTT_PORT=1883 MQTT_LOGGER_MQTT_TOPICS="+/debug homeassistant/#"
