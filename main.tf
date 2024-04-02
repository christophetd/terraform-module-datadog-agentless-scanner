module "aws" {
  count                   = var.use_aws ? 1 : 0
  source                  = "./modules/aws"
  api_key                 = var.api_key
  site                    = var.site
  tags                    = var.tags
  api_key_secret_arn      = var.api_key_secret_arn
  instance_profile_name   = var.instance_profile_name
  enable_ssm              = var.enable_ssm
  enable_ssm_vpc_endpoint = var.enable_ssm_vpc_endpoint
}
