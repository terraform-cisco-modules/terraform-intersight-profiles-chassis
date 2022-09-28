#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = {
    for v in [var.organization] : v => v if length(
      regexall("[[:xdigit:]]{24}", var.organization)
    ) == 0
  }
  name = each.value
}

#____________________________________________________________
#
# Chassis Moid Data Source
# GUI Location:
#   Operate > Chassis > Copy the Serial from the Column.
#____________________________________________________________

# data "intersight_chassis_profile_template" "template" {
#   for_each = {
#     for v in compact([var.chassis_template]) : v => v if length(
#       regexall("[[:xdigit:]]{24}", var.chassis_template)
#     ) == 0
#   }
#   name = each.value
# }

data "intersight_equipment_chassis" "chassis" {
  for_each = { for v in compact([var.serial_number]) : v => v }
  serial   = each.value
}


#____________________________________________________________
#
# Intersight UCS Chassis Profile Resource
# GUI Location: Profiles > UCS Chassis Profile > Create
#____________________________________________________________

resource "intersight_chassis_profile" "chassis" {
  depends_on = [
    #data.intersight_chassis_profile_template.template,
    data.intersight_equipment_chassis.chassis,
    data.intersight_organization_organization.org_moid
  ]
  action              = var.action
  description         = var.description != "" ? var.description : "${var.name} Chassis Profile."
  name                = var.name
  target_platform     = var.target_platform
  type                = var.type
  wait_for_completion = var.wait_for_completion
  organization {
    moid = length(
      regexall("[[:xdigit:]]{24}", var.organization)
      ) > 0 ? var.organization : data.intersight_organization_organization.org_moid[
      var.organization].results[0
    ].moid
    object_type = "organization.Organization"
  }
  dynamic "assigned_chassis" {
    for_each = { for v in compact([var.serial_number]) : v => v }
    content {
      moid = data.intersight_equipment_chassis.chassis.results[0].moid
    }
  }
  dynamic "policy_bucket" {
    for_each = { for v in var.policy_bucket : v => v }
    content {
      moid        = policy_bucket.value.moid
      object_type = policy_bucket.value.object_type
    }
  }
  # dynamic "src_template" {
  #   for_each = { for v in compact([var.chassis_template]) : v => v }
  #   content {
  #     moid = length(
  #       regexall("[[:xdigit:]]{24}", var.chassis_template)
  #     ) > 0 ? var.chassis_template : data.intersight_chassis_profile_template.template[
  #       src_template.value].results[0
  #     ].moid
  #   }
  # }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
