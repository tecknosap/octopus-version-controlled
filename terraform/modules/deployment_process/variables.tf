variable "address" {
  type    = string
  default = "https://tecknosap.octopus.app"
}

variable "api_key" {
  type      = string
  sensitive = true
}

variable "space_id" {
  type    = string
  default = "Spaces-1"
}

variable "project_id" {
  type = string
}

variable "azure_account_variable" {
  type    = string
  default = "#{AzureAccount}"
}