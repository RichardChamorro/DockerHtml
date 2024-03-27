  GNU nano 6.2                                                  Dockerfile                                                            
FROM ubuntu:22.04
# Instalacion de dependencias
RUN apt-get update \
    && apt-get install -y apache2 --no-install-recommends openjdk-17-jdk unzip git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Iniciar servicio apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
# Asiognacion de puerto
EXPOSE 444
