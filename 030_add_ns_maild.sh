#!/bin/bash

##
## Create k8s new namespace
##

KUBECONFIG=/etc/kubernetes/admin.conf
maild_ns='maild'

kubectl create namespace ${maild_ns}

