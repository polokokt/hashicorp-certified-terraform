`terraform plan -out ec2.plan`    - command to generate plan output and save it as the file.
`terraform apply ec2.plan`        - command to apply plan from the saved file.

`terraform show ec2.plan`         - command to show the plan file. 
`terraform show -json ec2.plan`   - show the plan file in json format

``terraform show -json ec2.plan | jq`  - recommended way to show the plan output from the plan.