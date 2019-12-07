#!/bin/bash
source "../playground.env"

KUBERNETES_ADDRESS=$API_SERVER_IP

for instance in $WORKER1_HOST $WORKER2_HOST; do
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority="../certs/ca.pem" \
    --embed-certs=true \
    --server=https://${KUBERNETES_ADDRESS}:6443 \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-credentials system:node:${instance} \
    --client-certificate="../certs/${instance}.pem" \
    --client-key="../certs/${instance}-key.pem" \
    --embed-certs=true \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:node:${instance} \
    --kubeconfig=${instance}.kubeconfig

  kubectl config use-context default --kubeconfig=${instance}.kubeconfig
done
