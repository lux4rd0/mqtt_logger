for item in $MQTT_LOGGER_MQTT_TOPICS; do mqtt_topics="${mqtt_topics} -t $item"; done
mosquitto_sub -h $MQTT_LOGGER_MQTT_HOSTNAME -p $MQTT_LOGGER_MQTT_PORT -u $MQTT_LOGGER_MQTT_USERNAME -P $MQTT_LOGGER_MQTT_PASSWORD -F %j $mqtt_topics | promtail --stdin --config.expand-env=true --config.file=/mqtt-logger/config.yaml
