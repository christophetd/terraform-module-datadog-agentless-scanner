data "azurerm_subscription" "current" {}

data "azurerm_key_vault_secret" "api_key" {
  name         = var.api_key_secret_name
  key_vault_id = var.api_key_vault_id
}

module "resource_group" {
  source   = "./resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source              = "./virtual-network"
  resource_group_name = module.resource_group.resource_group.name
  location            = var.location
  bastion             = var.bastion
  tags                = var.tags
}

module "custom_data" {
  source    = "./custom-data"
  location  = var.location
  api_key   = "@Microsoft.KeyVault(SecretUri=${data.azurerm_key_vault_secret.api_key.id})"
  site      = var.site
  client_id = module.managed_identity.identity.client_id
}

module "managed_identity" {
  source              = "./managed-identity"
  resource_group_name = module.resource_group.resource_group.name
  resource_group_id   = module.resource_group.resource_group.id
  location            = var.location
  api_key_secret_id   = data.azurerm_key_vault_secret.api_key.resource_versionless_id
  scan_scopes         = coalescelist(var.scan_scopes, [data.azurerm_subscription.current.id])
  tags                = var.tags
}

module "virtual_machine" {
  source                 = "./virtual-machine"
  depends_on             = [module.virtual_network]
  location               = var.location
  resource_group_name    = module.resource_group.resource_group.name
  admin_ssh_key          = var.admin_ssh_key
  custom_data            = module.custom_data.install_sh
  subnet_id              = module.virtual_network.subnet.id
  user_assigned_identity = module.managed_identity.identity.id
  tags                   = var.tags
}
