# OpsGenie Team Terraform module

Terraform module which creates Team in OpsGenie

## Usage

```terraform
module "team" {
  source = "git::https://github.com/pressreader/terraform-opsgenie-team.git?ref=v1.0.0"

  name        = "Name of a Team"
  description = "Description of the Team" # Defaults to null

  ignore_members           = false # Defaults to false
  delete_default_resources = false # Defaults to false
  
  # Defaults to []
  members = [
    {
      id   = "ID of an user"
      role = "Role for the user"
    },
  ]
}
```