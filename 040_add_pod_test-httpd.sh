#!/bin/bash

##
## Create pod
##

KUBECONFIG=/etc/kubernetes/admin.conf
maild_ns='maild'

## add external IP
kubectl -n ${maild_ns} apply -f ./yaml/pod_test-httpd.yaml
