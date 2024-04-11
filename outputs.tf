output "vpc" {
  description = "The VPC created for the Datadog agentless scanner"
  value       = var.use_aws ? module.aws.vpc.vpc : null
}

output "api_key_secret_arn" {
  description = "The ARN of the secret containing the Datadog API key"
  value       = var.use_aws ? module.aws.user_data.api_key_secret_arn : null
}
