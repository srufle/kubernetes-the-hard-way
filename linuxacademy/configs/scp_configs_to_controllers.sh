#!/bin/bash
source "../playground.env"

$SCP  admin.kubeconfig kube-controller-manager.kubeconfig kube-scheduler.kubeconfig \
      "${CONTROLLER1_HOST}:~/"

$SCP  admin.kubeconfig kube-controller-manager.kubeconfig kube-scheduler.kubeconfig \
      "${CONTROLLER2_HOST}:~/"

echo "Copy Data encrpytion config file"
$SCP  encryption-config.yaml \
      "${CONTROLLER1_HOST}:~/"

$SCP  encryption-config.yaml \
      "${CONTROLLER2_HOST}:~/"
