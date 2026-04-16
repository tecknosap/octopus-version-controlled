# Call global module to get all ID maps
module "global" {
  source = "./modules/global"
}

# Call project module and pass the maps from global
module "octopus_project" {
  source = "./modules/octopus_project"
  
  # Pass the maps from global module
  space_ids          = module.global.space_ids
  project_group_ids  = module.global.project_group_ids
  lifecycle_ids      = module.global.lifecycle_ids
  variable_set_ids   = module.global.variable_set_ids


   git_password = var.git_password

}


# module "deployment_process" {
#   source = "./modules/deployment_process"

#   # Pass the maps from global module
#   project_id = module.octopus_project.project_id
#    api_key    = var.api_key

  
# }

