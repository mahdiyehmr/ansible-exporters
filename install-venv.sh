#!/bin/bash
sudo pip3 install virtualenv
VENV_DIR=$(pwd)/.env
virtualenv "$VENV_DIR"
source .env/bin/activate
pip3 install -r requirements.txt
echo "After running this script, Please execute 'source ./.env/bin/activate'"