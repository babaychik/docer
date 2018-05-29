 
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get update
RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y curl wget unzip nano nginx supervisor
#consul-template
RUN curl -L https://releases.hashicorp.com/consul-template/0.19.4/consul-template_0.19.4_linux_amd64.zip -o consul-template_0.19.4_linux_amd64.zip && \
unzip consul-template_0.19.4_linux_amd64.zip -d /bin && \
chmod +x /bin/consul-template && \
mkdir /etc/consul-template
# Добавляем регистратор
RUN curl -L https://releases.hashicorp.com/consul/1.1.0/consul_1.1.0_linux_amd64.zip -o consul_1.1.0_linux_amd64.zip && \
unzip consul_1.1.0_linux_amd64.zip -d /bin && \
chmod +x /bin/consul
ADD http.json /etc/consul.d/http.json
ADD server.json /etc/consul.d/server.json
ADD nginx.ctmpl /etc/consul-template/nginx.ctmpl
ADD start.sh /bash/start.sh
RUN chmod +x /bash/start.sh
# Добавляем описание виртуального хоста (для теста)
ADD index.html /var/www/html/index.html
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
# Объявляем порты
EXPOSE 80
#для UI
EXPOSE 8500
CMD ["/usr/bin/supervisord"] 
#end
