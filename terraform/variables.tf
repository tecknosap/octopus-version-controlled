variable "api_key" {
  description = "Octopus Deploy API key (can also be set via environment variable: $env:TF_VAR_api_key)"
  type        = string
  sensitive   = true
}

variable "git_password" {
  type        = string
  sensitive   = true
  description = "GitHub Personal Access Token"
}
