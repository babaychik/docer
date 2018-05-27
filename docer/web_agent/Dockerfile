 
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get update
RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y curl wget unzip nano nginx supervisor
#Для регистрации
ADD consul /bin/consul
ADD http.json /etc/consul.d/http.json
ADD agent.json /etc/consul.d/agent.json
# Добавляем описание виртуального хоста (для теста)
ADD index.html /var/www/html/index.html
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
# Объявляем порты
EXPOSE 80
CMD ["/usr/bin/supervisord"] 
