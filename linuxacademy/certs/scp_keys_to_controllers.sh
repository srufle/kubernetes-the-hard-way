#!/bin/bash
source "../playground.env"

$SCP  ca.pem \
      ca-key.pem \
      kubernetes.pem \
      kubernetes-key.pem \
      service-account.pem \
      service-account-key.pem \
      "${CONTROLLER1_HOST}:~/"

$SCP  ca.pem \
      ca-key.pem \
      kubernetes.pem \
      kubernetes-key.pem \
      service-account.pem \
      service-account-key.pem \
      "${CONTROLLER2_HOST}:~/"
