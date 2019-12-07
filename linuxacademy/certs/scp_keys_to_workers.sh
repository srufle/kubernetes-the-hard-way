#!/bin/bash
source "../playground.env"

$SCP ca.pem "worker1/${WORKER1_HOST}-key.pem" "worker1/${WORKER1_HOST}.pem" "${WORKER1_HOST}:~/"
$SCP ca.pem "worker2/${WORKER2_HOST}-key.pem" "worker2/${WORKER2_HOST}.pem" "${WORKER2_HOST}:~/"
