We can have different terraform workspace to manege different environments , using the same terraform configuration files. \
And we will have separated terraform.state for each environment, located in the `terraform.tfstate.d` directory

basic command:

```
$ terraform workspace ?
Usage: terraform [global options] workspace

  new, list, show, select and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace
```