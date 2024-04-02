variable "name" {
  description = "Name of the managed identity to be assigned to the Datadog Agentless Scanner virtual machine instances"
  type        = string
  default     = "DatatogAgentlessScanner"
}

variable "location" {
  description = "TODO"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the managed identity will be created"
  type        = string
}

variable "resource_group_id" {
  description = "The ID of the resource group to which the role assignment will be scoped"
  type        = string
}

variable "tags" {
  description = "A map of additional tags to add to the managed identity"
  type        = map(string)
  default     = {}
}
