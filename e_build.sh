#!/bin/bash
# -*- coding: utf-8 -*-
# Install EFL, Enlightenment and cool stuff on arch

REPO_URL="https://git.enlightenment.org"

REPO_LIST="core/efl core/enlightenment apps/equate tools/edi"

for REPO in $REPO_LIST ; do
  NAME=`echo $REPO|cut -d'/' -f2`
  if [ -d "$NAME" ]; then
    echo "[PULL ] ${NAME}"
    cd ${NAME}
    git pull
    cd ..
  else
    echo "[CLONE] ${NAME}"
    git clone ${REPO_URL}/${REPO}.git ${NAME}
  fi

  echo "[BUILD] ${NAME}"
  cd ${NAME}
  ./autogen.sh
  make
  echo "[INST ] ${NAME}"
  sudo make install
  cd ..
done


