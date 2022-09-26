<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Profiles - UCS Chassis
Manages Intersight UCS Chassis Profiles

Location in GUI:
`Profiles` » `UCS Chassis Profiles` » `Create UCS Chassis Profile`

## Example

### main.tf
```hcl
module "chassis" {
  source  = "terraform-cisco-modules/pools-fc/intersight"
  version = ">= 1.0.1"

  action              = "No-Op"
  description         = "default Chassis Profile."
  name                = "default"
  organization        = "default"
  wait_for_completion = false
}

```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

### Environment Variables

Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_action"></a> [action](#input\_action) | Action to Perform on the Chassis Profile Assignment.  Options are:<br>* Deploy<br>* No-op<br>* Unassign | `string` | `"No-op"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the Profile. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Profile. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_policy_bucket"></a> [policy\_bucket](#input\_policy\_bucket) | List of Policies to Assign to the Profile. | <pre>list(object(<br>    {<br>      moid        = string<br>      object_type = string<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_serial_number"></a> [serial\_number](#input\_serial\_number) | Serial Number of the Chassis to Assign. | `string` | `""` | no |
| <a name="input_src_template"></a> [src\_template](#input\_src\_template) | A reference to a policyAbstractProfile resource.. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_target_platform"></a> [target\_platform](#input\_target\_platform) | The platform for which the chassis profile is applicable. It can either be a chassis that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.<br>* FIAttached - Chassis which are connected to a Fabric Interconnect that is managed by Intersight. | `string` | `"FIAttached"` | no |
| <a name="input_type"></a> [type](#input\_type) | Defines the type of the profile. Accepted values are:<br>* instance<br>* template | `string` | `"instance"` | no |
| <a name="input_wait_for_completion"></a> [wait\_for\_completion](#input\_wait\_for\_completion) | This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state. | `bool` | `false` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | UCS Chassis Profile Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_chassis_profile.chassis](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/chassis_profile) | resource |
| [intersight_equipment_chassis.chassis](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/equipment_chassis) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->