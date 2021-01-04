#!/bin/bash

##
## Set label on node
##

KUBECONFIG=/etc/kubernetes/admin.conf

kubectl label node $(hostname) maild=true

## remove lebel
#kubectl label node $(hostname) maild-

