#!/bin/bash

##
## Create k8s new namespace
##

KUBECONFIG=/etc/kubernetes/admin.conf

kubectl create namespace maild

