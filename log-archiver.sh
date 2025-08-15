#!/bin/bash

showhelp() {
  echo -e "\nlog-archiver.sh: log-archiver.sh [--help | -h] TARGET-LOGDIR [DEST-DIR]\n"
  echo -e "Options:\n\t--help | -h  Print this help page.\n"
  echo -e "Postional arguments:\n\tTARGET-LOGDIR  Path to the log directory to archive. This is a required argument.\n"
  echo -e "\n\tDEST-DIR  Path to the log directory to store the archive. This is an optional argument.\n"
}

if [[ $1 == "--help" || $1 == "-h" ]]; then
  showhelp
  exit 0
elif [[ $# > "2" ]]; then
  echo "[X]Error: Too many arguments."
  showhelp
  exit 0
fi


TARGETLOGDIR="$1"
DESTDIR="$2"

# This script should only take 2 arguments:
# 1) Log directory to compress.
# 2) Destination directory to store the compressed logs.
#
# If more than 2 arguments are supplied to the script, then ...
# it should write an error to stderr.
#
# If the Destination directory does not exist, then Destination
# directory should be created.


date_time=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="logs_archive_$date_time.tar.gz"

tar -czv -f $ARCHIVE_NAME $TARGETLOGDIR
if [[ $? == "0" ]]; then
  echo -e "\n[*]New archive created: $ARCHIVE_NAME\n"
else
  echo -e "\n[X]Error occured!!!\n"
fi


if [[ $# == "2" ]]; then
  if [[ -e $DESTDIR ]]; then
    if [[ -d $DESTDIR ]]; then
      mv $ARCHIVE_NAME $DESTDIR
      echo -e "[*]Archive moved to $DESTDIR"
    else
      echo -e "\n[X]Error: $DESTDIR is not a directory."
    fi
  else
    echo -e "\n[X]Error: $DESTDIR does not exist."
  fi
fi
