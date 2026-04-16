output "space_ids" {
  description = "Map of space names to IDs"
  value       = local.space_ids
}

output "project_group_ids" {
  description = "Map of project group names to IDs"
  value       = local.project_group_ids
}

output "lifecycle_ids" {
  description = "Map of lifecycle names to IDs"
  value       = local.lifecycle_ids
}

output "environment_ids" {
  description = "Map of environment names to IDs"
  value       = local.environment_ids
}

output "account_ids" {
  description = "Map of account names to IDs"
  value       = local.account_ids
}

output "worker_pool_ids" {
  description = "Map of worker pool names to IDs"
  value       = local.worker_pool_ids
}

output "variable_set_ids" {
  description = "Map of library variable set names to IDs"
  value       = local.variable_set_ids
}

output "tenant_ids" {
  description = "Map of tenant names to IDs"
  value       = local.tenant_ids
}