locals {
  dd_tags = {
    Datadog                 = "true"
    DatadogAgentlessScanner = "true"
  }
}

locals {
  agent_version   = "50.3"
  scanner_version = "7.51.0~agentless~scanner~2024022201"
}

resource "terraform_data" "template" {
  input = templatefile("${path.module}/templates/install.sh.tftpl", {
    api_key         = var.api_key
    site            = var.site,
    agent_version   = local.agent_version,
    scanner_version = local.scanner_version,
    region          = var.location,
  })
}
