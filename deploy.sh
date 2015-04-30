#!/bin/bash
set -e
set -x

: ${ENV?"Need to set ENV"}

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ansible-playbook -i $DIR/server-inventories/$ENV $DIR/playbook-setup.yml -v
echo "Deploying app..."
cd ../
echo $DIR/server-inventories/$ENV
ansible-playbook -i $DIR/server-inventories/$ENV $DIR/playbook-build-app.yml --connection=local -v
ansible-playbook -i $DIR/server-inventories/$ENV -M ./library $DIR/playbook-app-only.yml -v

# wait
echo Deployment finished for $ENV.
