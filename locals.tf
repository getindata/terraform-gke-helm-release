locals{
  # GCP service account ids must be <= 30 chars matching regex ^[a-z](?:[-a-z0-9]{4,28}[a-z0-9])$
  # KSAs do not have this naming restriction.
  gcp_given_name = var.gcp_sa_name != null ? var.gcp_sa_name : trimsuffix(substr(var.name, 0, 30), "-")
  gcp_sa_email   = var.use_existing_gcp_sa ? data.google_service_account.cluster_service_account[0].email : google_service_account.cluster_service_account[0].email
  gcp_sa_fqn     = "serviceAccount:${local.gcp_sa_email}"

  # This will cause Terraform to block returning outputs until the service account is created
  k8s_given_name       = var.k8s_sa_name != null ? var.k8s_sa_name : var.name
  output_k8s_name      = var.use_existing_k8s_sa ? local.k8s_given_name : kubernetes_service_account.main[0].metadata[0].name
  output_k8s_namespace = var.use_existing_k8s_sa ? var.namespace : kubernetes_service_account.main[0].metadata[0].namespace

  k8s_sa_project_id       = var.k8s_sa_project_id != null ? var.k8s_sa_project_id : var.project_id
  k8s_sa_gcp_derived_name = "serviceAccount:${local.k8s_sa_project_id}.svc.id.goog[${var.namespace}/${local.output_k8s_name}]"

  sa_binding_additional_project = distinct(flatten([for project, roles in var.additional_projects : [for role in roles : { project_id = project, role_name = role }]]))
}