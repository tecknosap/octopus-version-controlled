terraform {
  required_providers {
    octopusdeploy = {
      source  = "octopusdeploy/octopusdeploy"
      version = "~> 1.10"
    }
  }
}

locals {
  azure_props = {
    "Octopus.Action.Script.ScriptSource" = "Inline"
    "Octopus.Action.Script.Script.Syntax" = "PowerShell"
    "OctopusUseBundledTooling"           = "True"
    "Octopus.Action.Azure.AccountId"     = var.azure_account_variable
    "Octopus.Action.Script.ScriptBody"   = "Write-Host 'Running...'"
  }

  step_names = [
    "Add subscriptions to service bus topics",
    "Create function app",
    "Get Principal Id",
    "Grant KeyVault access to function app",
    "Grant Shared KeyVault access to function app",
    "Restrict App Insights Access to Function App",
    "Function App VNET Integration",
    "Grant VNET ServiceTag Access to Function app",
    "Create Function app slot",
    "Get Slot Principal Id",
    "Slot - Grant KeyVault access to function app",
    "Slot - Grant Shared KeyVault access to function app",
    "Add Environment Variables from App Config",
    "Publish Package to Function app",
    "Slot Warmup",
    "Swap Function Slot",
    "Grant APIM Access to Function App",
    "Deploy APIM templates",
    "Add Healthchecks",
    "Set Tags"
  ]
}

resource "octopusdeploy_deployment_process" "process" {
  project_id = var.project_id

  dynamic "step" {
    for_each = local.step_names

    content {
      name      = step.value
      condition = "Success"

      action {
        name        = step.value
        action_type = "Octopus.AzurePowerShell"
        properties  = local.azure_props
      }
    }
  }
}