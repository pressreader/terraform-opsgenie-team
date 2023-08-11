variable "name" {
  description = "The name associated with this team. Opsgenie defines that this must not be longer than 100 characters."
  type        = string
}

variable "description" {
  description = "A description for this team. Defaults to null."
  type        = string
  default     = null
}

variable "ignore_members" {
  description = "Set to true to ignore any configured member blocks and any team member added/updated/removed via OpsGenie web UI. Use this option e.g. to maintain membership via web UI only and use it only for new teams. Changing the value for existing teams might lead to strange behaviour. Defaults to false."
  type        = bool
  default     = false
}

variable "delete_default_resources" {
  description = "Set to true to remove default escalation and schedule for newly created team. Be careful its also changes that team routing rule to None. That means you have to define routing rule as well. Defaults to false."
  type        = bool
  default     = false
}

variable "members" {
  description = <<EOF
  <br><b>id:</b> The UUID for the member to add to this Team.
  <br><b>role:</b> The role for the user within the Team - can be either admin or user. Defaults to user.
EOF
  type        = list(object({
    id   = string
    role = string
  }))
  default = []

  validation {
    condition     = alltrue([for v in var.members : contains(["user", "admin"], v.role)])
    error_message = "The role value must be one of user or admin."
  }
}