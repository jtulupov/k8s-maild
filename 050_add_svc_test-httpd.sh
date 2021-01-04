#!/bin/bash

##
## Create service
##

KUBECONFIG=/etc/kubernetes/admin.conf
maild_ns='maild'
additional_ip='192.168.1.112'

## add service
kubectl -n ${maild_ns} apply -f ./yaml/svc_test-httpd.yaml

## add external IP
kubectl -n ${maild_ns} patch svc test-httpd --type='json' -p='[{"op": "add", "path": "/spec/externalIPs", "value": ["192.168.1.112"]}]'
