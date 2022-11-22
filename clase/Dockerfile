FROM ubuntu
RUN apt-get update && apt install -y apache2
CMD ["apachectl","-DFOREGROUND"]

#docker build -t apache-web .  