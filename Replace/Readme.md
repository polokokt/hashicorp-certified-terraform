When somebody manually change the configuration of the instance on AWS, we can recreate the resource by `replace` command.
The command delete the old instance with changes, and create a new one according to the configuration in terraform cfiles:


`terraform apply -replace="aws_instance.web"`