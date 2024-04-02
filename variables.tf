variable "use_aws" {
  description = "Create AWS resources"
  type        = bool
  default     = false
}

variable "use_azure" {
  description = "Create Azure resources"
  type        = bool
  default     = false
}

variable "api_key" {
  description = "Specifies the API keys required by the Datadog Agent to submit vulnerabilities to Datadog"
  type        = string
  sensitive   = true
  default     = null
}

variable "site" {
  description = "By default the Agent sends its data to Datadog US site. If your organization is on another site, you must update it. See https://docs.datadoghq.com/getting_started/site/"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of additional tags to add to the IAM role/profile created"
  type        = map(string)
  default     = {}
}

#################
# AWS variables #
#################

variable "api_key_secret_arn" {
  description = "ARN of the secret holding the Datadog API key. Takes precedence over api_key variable"
  type        = string
  default     = null
}

variable "instance_profile_name" {
  description = "Name of the instance profile to attach to the instance"
  type        = string
}

variable "enable_ssm" {
  description = "Whether to enable AWS SSM to facilitate executing troubleshooting commands on the instance"
  type        = bool
  default     = false
}

variable "enable_ssm_vpc_endpoint" {
  description = "Whether to enable AWS SSM VPC endpoint (only applicable if enable_ssm is true)"
  type        = bool
  default     = true
}

###################
# Azure variables #
###################

variable "resource_group_name" {
  description = "Azure resource group where the Datadog Agentless Scanner resources will be created"
  type        = string
  default     = null
}

variable "location" {
  description = "Azure location where the Datadog Agentless Scanner resources will be created"
  type        = string
  nullable    = false
}

variable "admin_ssh_key" {
  description = "SSH public key of the admin user"
  type        = string
}

variable "bastion" {
  description = "Create a bastion in the subnet"
  type        = bool
  default     = false
  nullable    = false
}
