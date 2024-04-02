output "vpc" {
  description = "The VPC created for the Datadog agentless scanner"
  value       = module.aws.vpc.vpc
}

output "api_key_secret_arn" {
  description = "The ARN of the secret containing the Datadog API key"
  value       = module.aws.user_data.api_key_secret_arn
}
