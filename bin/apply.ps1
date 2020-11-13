
terraform init
terraform apply

# connect to the cluster
iex "$(terraform output connect)"

# output jx-requirements
terraform output jx_requirements  >  jx-requirements.yml
