locals {
  scanner_version = "0.11"
}

resource "terraform_data" "template" {
  input = templatefile("${path.module}/templates/install.sh.tftpl", {
    api_key         = var.api_key
    site            = var.site,
    azure_client_id = var.client_id,
    scanner_version = local.scanner_version,
    region          = var.location,
  })
}
