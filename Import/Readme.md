After prepare input.tf file with neccesary data
There is a need to run the command:

`terraform plan -generate-config-out=mysg.tf`     - so we will receive the tf file with the whole configuration/definition of the resource

Above comand only produces tf file with configuration. The configuration is not in the terraform.state file. 

This import feature work from the Terraform v1.5
