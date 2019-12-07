#!/bin/bash
source "../playground.env"

$SCP ca.pem "${WORKER1_HOST}-key.pem" "${WORKER1_HOST}.pem" "${WORKER1_HOST}:~/"
$SCP ca.pem "${WORKER2_HOST}-key.pem" "${WORKER2_HOST}.pem" "${WORKER2_HOST}:~/"
