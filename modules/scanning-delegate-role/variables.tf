variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = "DatadogAgentlessScannerDelegateRole"
}

variable "iam_role_path" {
  description = "IAM role and policies path"
  type        = string
  default     = "/"
}

variable "datastores_scanning_enabled" {
  description = "Installs specific permissions to enable scanning of datastores (S3 buckets and RDS instances)"
  type        = bool
  default     = false
}

variable "scanner_roles" {
  description = "List of roles ARN allowed to assume this role"
  type        = list(string)
}

variable "tags" {
  description = "A map of additional tags to add to the IAM role/profile created"
  type        = map(string)
  default     = {}
}
