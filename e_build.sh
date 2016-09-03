#!/bin/bash
# -*- coding: utf-8 -*-
# Install EFL, Enlightenment and cool stuff on arch

REPO_URL="https://git.enlightenment.org"

REPO_LIST="core/efl core/enlightenment apps/equate apps/terminology tools/edi"

LOG_FILE=.e_build.out

function quit {
  IFS='
'
  echo "[FAIL ] Exiting script - last 5 lines of output (see .e_build.out)"
  echo

  if [ -e "$LOG_FILE" ]; then
    for LINE in `tail -5 .e_build.out`; do
      echo "[LOG  ] $LINE";
    done
  fi
  exit 1
}

for REPO in $REPO_LIST ; do
  NAME=`echo $REPO|cut -d'/' -f2`
  if [ -d "$NAME" ]; then
    echo "[PULL ] ${NAME}"
    cd ${NAME}
    git pull -q --rebase 1>&2 2>$LOG_FILE || quit
    cd ..
  else
    echo "[CLONE] ${NAME}"
    git clone -q ${REPO_URL}/${REPO}.git ${NAME} 1>&2 2>$LOG_FILE || quit
  fi

  echo "[BUILD] ${NAME}"
  cd ${NAME}
  ./autogen.sh > /dev/null 2>$LOG_FILE || quit
  make > /dev/null 2>$LOG_FILE || quit
  echo "[INST ] ${NAME}"
  sudo make install
  cd ..
done


