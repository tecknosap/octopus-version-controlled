#
# Global Lookups Required for Project
#

terraform {
  required_providers {
    octopusdeploy = {
      source  = "octopusdeploy/octopusdeploy"
      version = "~> 1.10"
    }
  }
}

data "octopusdeploy_spaces" "all" {
  take = 1000
}

data "octopusdeploy_project_groups" "all" {
  take = 1000
}

data "octopusdeploy_lifecycles" "all" {
  take = 1000
}

data "octopusdeploy_environments" "all" {
  take = 1000
}

data "octopusdeploy_accounts" "all" {
  take = 1000
}

data "octopusdeploy_worker_pools" "all" {
  take = 1000
}

data "octopusdeploy_library_variable_sets" "all" {
  take = 1000
}

data "octopusdeploy_tenants" "all" {
  take = 1000
}

#
# Name → ID Maps
#

locals {
  space_ids = {
    for s in data.octopusdeploy_spaces.all.spaces :
    s.name => s.id
  }

  project_group_ids = {
    for pg in data.octopusdeploy_project_groups.all.project_groups :
    pg.name => pg.id
  }

  lifecycle_ids = {
    for lc in data.octopusdeploy_lifecycles.all.lifecycles :
    lc.name => lc.id
  }

  environment_ids = {
    for e in data.octopusdeploy_environments.all.environments :
    e.name => e.id
  }

  account_ids = {
    for a in data.octopusdeploy_accounts.all.accounts :
    a.name => a.id
  }

  worker_pool_ids = {
    for w in data.octopusdeploy_worker_pools.all.worker_pools :
    w.name => w.id
  }

  variable_set_ids = {
    for vs in data.octopusdeploy_library_variable_sets.all.library_variable_sets :
    vs.name => vs.id
  }

  tenant_ids = {
    for t in data.octopusdeploy_tenants.all.tenants :
    t.name => t.id
  }
}