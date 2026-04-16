terraform {
  required_providers {
    octopusdeploy = {
      source  = "octopusdeploy/octopusdeploy"
      version = "~> 1.10"
    }
  }
}
provider "octopusdeploy" {
  address = "https://tecknosap.octopus.app"
  api_key = var.api_key
}



