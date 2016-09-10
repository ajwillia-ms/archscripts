#!/bin/sh
# -*- coding: utf-8 -*-
# Install EFL, Enlightenment and cool stuff on arch

echo "This script has been replaced by the EFL \"efler\" application"
echo -n "Type 'Y' if you would like to run efler bootstrap: "
read ANSWER
echo ""

if [[ "$ANSWER" != "Y" ]] && [[ "$ANSWER" != "y" ]]; then
  exit 1
fi

bash -c "$(curl -fsSL https://git.enlightenment.org/devs/ajwillia-ms/efler.git/plain/bootstrap.sh)"

