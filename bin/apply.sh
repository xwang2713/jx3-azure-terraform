#!/bin/bash

set -e

terraform init
terraform apply

# connect to the cluster
eval "$(terraform output connect)"

# output jx-requirements
terraform output jx_requirements  >  jx-requirements.yml
