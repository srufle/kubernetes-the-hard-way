#!/bin/bash
source "../playground.env"
KUBERNETES_ADDRESS=$API_SERVER_IP
CERTS_DIR="../certs"

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=${CERTS_DIR}/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=kube-scheduler.kubeconfig

  kubectl config set-credentials system:kube-scheduler \
    --client-certificate=${CERTS_DIR}/kube-scheduler.pem \
    --client-key=${CERTS_DIR}/kube-scheduler-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-scheduler.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-scheduler \
    --kubeconfig=kube-scheduler.kubeconfig

  kubectl config use-context default --kubeconfig=kube-scheduler.kubeconfig
}
