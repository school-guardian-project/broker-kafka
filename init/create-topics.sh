#!/bin/bash

echo "Esperando a Kafka..."

until /opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server kafka:9092 \
    --list > /dev/null 2>&1
do
    sleep 2
done

echo "Kafka está disponible."

while IFS=: read -r topic partitions replication_factor
do
    # Ignorar líneas vacías y comentarios
    [[ -z "$topic" || "$topic" =~ ^# ]] && continue

    echo "Creando topic: $topic"

    /opt/kafka/bin/kafka-topics.sh \
        --bootstrap-server kafka:9092 \
        --create \
        --if-not-exists \
        --topic "$topic" \
        --partitions "$partitions" \
        --replication-factor "$replication_factor"

done < /topics.conf

echo "Inicialización de Kafka finalizada."