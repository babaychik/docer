#!/bin/bash
CONSUL="localhost:8500"
# Try to make initial configuration every 5 seconds until successful
consul-template -once -retry 5s -consul-addr $CONSUL -template "/etc/consul-template/nginx.ctmpl:/etc/nginx/nginx.conf"
# for changes every 10 seconds
consul-template -consul-addr $CONSUL -template "/etc/consul-template/nginx.ctmpl:/etc/nginx/nginx.conf:service nginx reload" 
echo "[nginx] starting nginx ..."
nginx
 
