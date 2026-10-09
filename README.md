# broker-kafka

Los archivos de `init` usan finales de linea LF para ejecutarse dentro de Linux,
tambien cuando se trabaja desde Windows. El inicializador procesa la ultima
linea de `topics.conf` aunque no termine en un salto de linea.