#!/usr/bin/env bash
#elastic search
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.0-x86_64.rpm
sudo rpm -i elasticsearch-7.6.0-x86_64.rpm
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
#sudo systemctl start elasticsearch.service

#kibana
curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-7.6.0-x86_64.rpm
sudo rpm -i kibana-7.6.0-x86_64.rpm
sudo systemctl daemon-reload
sudo systemctl enable kibana.service

#sudo systemctl start kibana.service
