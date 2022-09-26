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

variable "description" {
  default     = ""
  description = "Description for the Profile."
  type        = string
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

variable "policy_bucket" {
  default     = []
  description = "List of Policies to Assign to the Profile."
  type = list(object(
    {
      moid        = string
      object_type = string
    }
  ))
}

variable "serial_number" {
  default     = ""
  description = "Serial Number of the Chassis to Assign."
  type        = string
}

variable "src_template" {
  default     = ""
  description = "A reference to a policyAbstractProfile resource.."
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
