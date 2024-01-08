module "workload_identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version    = "v29.0.0"
  name       = var.name
  namespace  = var.namespace
  project_id = var.project_id
  roles      = var.roles
}

resource "helm_release" "example" {
  name       = var.name
  repository = var.repository
  chart      = var.chart
  version    = var.chart_version

  values = [
    file(var.values)
  ]

  set {
    name  = "serviceAccount.name"
    value = "module.workload_identity.k8s_service_account_name"
  }

}
