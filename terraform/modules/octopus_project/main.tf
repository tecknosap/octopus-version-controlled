terraform {
  required_providers {
    octopusdeploy = {
      source  = "octopusdeploy/octopusdeploy"
      version = "~> 1.10"
    }
  }
}

resource "octopusdeploy_git_credential" "git_credential" {
  name     = "GitHub Credential-${var.project_name}-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  username = var.git_username
  password = var.git_password
}

resource "octopusdeploy_project" "octopus_projects" {
  name        = "${var.project_name}-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  description = var.project_description

  space_id         = var.space_ids[var.space_name]
  project_group_id = var.project_group_ids[var.project_group_name]
  lifecycle_id     = var.lifecycle_ids[var.lifecycle_name]

  is_version_controlled = true

  git_library_persistence_settings {
    git_credential_id = octopusdeploy_git_credential.git_credential.id
    url               = "https://github.com/tecknosap/octopus-version-controlled.git"
    default_branch    = "main"
    base_path         = ".octopus-${var.project_name}"  # ← CHANGED to be unique
    protected_branches = []
  }

  included_library_variable_sets = [
    for name in var.variable_set_names :
    var.variable_set_ids[name]
  ]
}

# resource "octopusdeploy_project_versioning_strategy" "versioning" {
#   project_id = octopusdeploy_project.octopus_projects.id
#   space_id   = var.space_ids[var.space_name]
#   template   = "#{Octopus.Version.LastMajor}.#{Octopus.Version.LastMinor}.#{Octopus.Version.NextPatch}"
# }

