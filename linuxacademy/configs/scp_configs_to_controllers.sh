#!/bin/bash
source "../playground.env"

$SCP  admin.kubeconfig kube-controller-manager.kubeconfig kube-scheduler.kubeconfig \
      "${CONTROLLER1_HOST}:~/"

$SCP  admin.kubeconfig kube-controller-manager.kubeconfig kube-scheduler.kubeconfig \
      "${CONTROLLER2_HOST}:~/"
