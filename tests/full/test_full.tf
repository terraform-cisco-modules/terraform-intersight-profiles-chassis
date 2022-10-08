module "main" {
  source       = "../.."
  description  = "${var.name} Chassis Profile."
  name         = var.name
  organization = "terratest"
}
