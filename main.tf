resource "opsgenie_team" "main" {
  name                     = var.name
  description              = var.description
  ignore_members           = var.ignore_members
  delete_default_resources = var.delete_default_resources

  dynamic "member" {
    for_each = {for v in var.members : v["id"] => v}
    content {
      id   = member.value.id
      role = member.value.role
    }
  }
}