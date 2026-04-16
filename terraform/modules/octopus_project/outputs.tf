output "project_id" {
  description = "ID of the created project"
  value       = octopusdeploy_project.octopus_projects.id
}

output "git_credential_id" {
  description = "ID of the git credential"
  value       = octopusdeploy_git_credential.git_credential.id
}

