
# in case we are in a clean git clone...
terraform init $TERRAFORM_INPUT

# we are about to remove the kubernetes cluster anyway so lets avoid having terraform try and remove k8s resources
terraform state list | select-string -pattern kubernetes_service_account | ForEach-Object {
   $line = $($_ -replace '\s\s+','')
   if ( "$line" )
   {
      "removing terraform state of $line"
      terraform state rm $line
   }
   else
   {
      "ignoring empty line"
   }
}



terraform state list | select-string -pattern kubernetes_namespace | ForEach-Object {
   $line = $($_ -replace '\s\s+','')
   if ( "$line" )
   {
      "removing terraform state of $line"
      terraform state rm $line
   }
   else
   {
      "ignoring empty line"
   }
}


terraform destroy $TERRAFORM_APPROVE

