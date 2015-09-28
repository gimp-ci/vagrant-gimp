#!/bin/bash
#Sam Gleske
#Sun Sep 13 01:43:51 GMT 2015
#setup everything

#try to run a script 3 times in case it fails (typically because of out of date
#mirrors from Debian when trying to install packages)

#try the bootstrap else fail
if /build/bootstrap.sh; then
  cat < /build/messages/success.txt
else
  cat < /build/messages/failure.txt
  exit 1
fi
