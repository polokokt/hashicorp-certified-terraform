`terraform.tfvars` is using by default, so there is no need to point it in the plan/apply by -var-file param.

If there is tfvars file with the name different than terraform.tfvars, there is a need to use the flag. 
For example there is possibility to split the configuration between different environments (dev, prod, stage...) and use different tfvars file for different env.

terraform apply -var-file dev.tfvars
terraform apply -var-file prod.tfvars
terraform apply -var-file stage.tfvars


##############################################################

To define variable in the command line:

terraform plan -var="instance_type=t2.micro"


#############################################################

You can define environment variable where the name start with: TF_VAR_   (for example: TF_VAR_instance_type).
To take the variable from the environment settings.


################################################################

Variable Definition Precedence


 * TF_VAR_ environment variable     (value=1)

 * .tfvars file                     (value=2)

 * -var option in the comment line  (value=3)


 result in the resource: value = 3  <<<< -------