# Input maps from global module
variable "space_ids" {
  type        = map(string)
  description = "Map of space names to IDs"
}

variable "project_group_ids" {
  type        = map(string)
  description = "Map of project group names to IDs"
}

variable "lifecycle_ids" {
  type        = map(string)
  description = "Map of lifecycle names to IDs"
}

variable "variable_set_ids" {
  type        = map(string)
  description = "Map of library variable set names to IDs"
}

# Project configuration
variable "project_name" {
  type        = string
  description = "Name of the Octopus project."
  default     = "octopus-version-project"
}

variable "space_name" {
  type        = string
  description = "Name of the Octopus space."
  default     = "Default"
}

variable "project_description" {
  type        = string
  description = "Description of the Octopus project."
  default     = "terraform - version controlled infrastructure with Terraform and Octopus Deploy."
}

variable "project_group_name" {
  type        = string
  description = "Name of the project group."
  default     = "Infrastructures"
}

variable "lifecycle_name" {
  type        = string
  description = "Name of the lifecycle assigned to the project."
  default     = "Standard Promotion"
}

variable "variable_set_names" {
  type        = list(string)
  description = "List of library variable set names to include in the project."
  default = [
    "Azure Resources",
    "Azure SQL Server Resources",
    "Certificates",
    "Database Server"
  ]
}

variable "git_username" {
  type        = string
  description = "Git username/email for authentication"
  default     = "tecknosap@gmail.com"
}

variable "git_password" {
  type        = string
  sensitive   = true
  description = "GitHub PAT or password"
  #default     = "Ilwaad01"

}

variable "azure_account_variable" {
  type        = string
  description = "Azure account variable reference"
  default     = "#{AzureAccount}"
}