#!/bin/bash
source "../playground.env"
KUBERNETES_ADDRESS=$API_SERVER_IP
CERTS_DIR="../certs"
{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=${CERTS_DIR}/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_ADDRESS}:6443 \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config set-credentials system:kube-proxy \
    --client-certificate=${CERTS_DIR}/kube-proxy.pem \
    --client-key=${CERTS_DIR}/kube-proxy-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-proxy \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config use-context default --kubeconfig=kube-proxy.kubeconfig
}
