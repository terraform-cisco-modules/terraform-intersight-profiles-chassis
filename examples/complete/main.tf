module "chassis" {
  source  = "terraform-cisco-modules/profiles-chassis/intersight"
  version = ">= 1.0.1"

  action              = "No-Op"
  description         = "default Chassis Profile."
  name                = "default"
  organization        = "default"
  wait_for_completion = false
}

