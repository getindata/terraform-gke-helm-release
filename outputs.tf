output "gcp_service_account" {
  value       = module.workload_identity.gcp_service_account
  description = "GCP service account."
}
output "gcp_service_account_email" {
  value       = module.workload_identity.gcp_service_account_email
  description = "Email address of GCP service account."
}
output "gcp_service_account_fqn" {
  value       = module.workload_identity.gcp_service_account_fqn
  description = "FQN of GCP service account."
}
output "gcp_service_account_name" {
  value       = module.workload_identity.gcp_service_account_name
  description = "Name of GCP service account."
}
output "k8s_service_account_name" {
  value       = module.workload_identity.k8s_service_account_name
  description = "Name of K8S service account."
}
output "k8s_service_account_namespace" {
  value       = module.workload_identity.k8s_service_account_namespace
  description = "Namespace of k8s service account."
}
output "deployment" {
  value       = var.app["deploy"] ? helm_release.this[0].metadata : []
  description = "The state of the helm deployment"
}
