#!/bin/bash
source "../playground.env"
KUBERNETES_ADDRESS=$API_SERVER_IP
CERTS_DIR="../certs"

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=${CERTS_DIR}/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=kube-controller-manager.kubeconfig

  kubectl config set-credentials system:kube-controller-manager \
    --client-certificate=${CERTS_DIR}/kube-controller-manager.pem \
    --client-key=${CERTS_DIR}/kube-controller-manager-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-controller-manager.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-controller-manager \
    --kubeconfig=kube-controller-manager.kubeconfig

  kubectl config use-context default --kubeconfig=kube-controller-manager.kubeconfig
}
