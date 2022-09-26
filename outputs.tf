#____________________________________________________________
#
# Collect the moid of the UCS Chassis Profile
#____________________________________________________________

output "moid" {
  description = "UCS Chassis Profile Managed Object ID (moid)."
  value       = intersight_chassis_profile.chassis.moid
}
