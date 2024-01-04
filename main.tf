data "google_service_account" "cluster_service_account" {
  count = var.use_existing_gcp_sa ? 1 : 0

  account_id = local.gcp_given_name
  project    = var.project_id
}

resource "google_service_account" "cluster_service_account" {
  count = var.use_existing_gcp_sa ? 0 : 1

  account_id   = local.gcp_given_name
  display_name = substr("GCP SA bound to K8S SA ${local.k8s_sa_project_id}[${local.k8s_given_name}]", 0, 100)
  project      = var.project_id
}

resource "kubernetes_service_account" "main" {
  count = var.use_existing_k8s_sa ? 0 : 1

  automount_service_account_token = var.automount_service_account_token
  metadata {
    name      = local.k8s_given_name
    namespace = var.namespace
    annotations = {
      "iam.gke.io/gcp-service-account" = local.gcp_sa_email
    }
  }
}

module "annotate_sa" {
  source  = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"
  version = "~> 3.1"

  enabled                     = var.use_existing_k8s_sa && var.annotate_k8s_sa
  skip_download               = var.skip_download
  cluster_name                = var.cluster_name
  cluster_location            = var.location
  project_id                  = local.k8s_sa_project_id
  impersonate_service_account = var.impersonate_service_account
  use_existing_context        = var.use_existing_context

  kubectl_create_command  = "kubectl annotate --overwrite sa -n ${local.output_k8s_namespace} ${local.k8s_given_name} iam.gke.io/gcp-service-account=${local.gcp_sa_email}"
  kubectl_destroy_command = "kubectl annotate sa -n ${local.output_k8s_namespace} ${local.k8s_given_name} iam.gke.io/gcp-service-account-"

  module_depends_on = var.module_depends_on
}

resource "google_service_account_iam_member" "main" {
  service_account_id = var.use_existing_gcp_sa ? data.google_service_account.cluster_service_account[0].name : google_service_account.cluster_service_account[0].name
  role               = "roles/iam.workloadIdentityUser"
  member             = local.k8s_sa_gcp_derived_name
}

resource "google_project_iam_member" "workload_identity_sa_bindings" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  member  = local.gcp_sa_fqn
}

resource "google_project_iam_member" "workload_identity_sa_bindings_additional_projects" {
  for_each = { for entry in local.sa_binding_additional_project : "${entry.project_id}.${entry.role_name}" => entry }

  project = each.value.project_id
  role    = each.value.role_name
  member  = local.gcp_sa_fqn
}
