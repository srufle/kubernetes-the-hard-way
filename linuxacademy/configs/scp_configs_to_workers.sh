#!/bin/bash
source "../playground.env"

$SCP "${WORKER1_HOST}.kubeconfig" "kube-proxy.kubeconfig" "${WORKER1_HOST}:~/"
$SCP "${WORKER2_HOST}.kubeconfig" "kube-proxy.kubeconfig" "${WORKER2_HOST}:~/"
