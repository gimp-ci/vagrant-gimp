#!/bin/bash
#This script is to help with reliability of installing packages on a dodgey
#network connection.  It basically retries 3 times while executing
#apt-get update --fix-missing
set -e
source /build/buildconfig
set +e
set -x
retries=0
STATUS=1
while [ "${retries}" -lt 3 ] && [ ! "${STATUS}" = "0" ]; do
  apt-get update --fix-missing
  $@
  STATUS="$?"
  ((retries++))
done
exit ${STATUS}
