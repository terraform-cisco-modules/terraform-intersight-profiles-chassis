#____________________________________________________________
#
# UCS Chassis Profile Variables Section.
#____________________________________________________________

variable "action" {
  default     = "No-op"
  description = <<-EOT
    Action to Perform on the Chassis Profile Assignment.  Options are:
    * Deploy
    * No-op
    * Unassign
  EOT
  type        = string
}

variable "chassis_template" {
  default     = ""
  description = "NOT YET SUPPORTED.  The Name of the Chassis Template to Assign to the Chassis."
  type        = string
}

variable "description" {
  default     = ""
  description = "Description for the Profile."
  type        = string
}

variable "moids" {
  default     = false
  description = "Flag to Determine if pools and policies should be data sources or if they already defined as a moid."
  type        = bool
}

variable "name" {
  default     = "default"
  description = "Name for the Profile."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "policies" {
  default     = {}
  description = "Map for Moid based Policy Sources."
  type        = any
}

variable "policy_bucket" {
  default     = []
  description = "List of Policies to Assign to the Profile."
  type = list(object(
    {
      name        = string
      object_type = string
      policy      = optional(string)
    }
  ))
}

variable "serial_number" {
  default     = ""
  description = "Serial Number of the Chassis to Assign."
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}

variable "target_platform" {
  default     = "FIAttached"
  description = <<-EOT
    The platform for which the chassis profile is applicable. It can either be a chassis that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.
    * FIAttached - Chassis which are connected to a Fabric Interconnect that is managed by Intersight.
  EOT
  type        = string
}

variable "type" {
  default     = "instance"
  description = <<-EOT
    Defines the type of the profile. Accepted values are:
    * instance
    * template
  EOT
  type        = string
}

variable "wait_for_completion" {
  default     = false
  description = "This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state."
  type        = bool
}
