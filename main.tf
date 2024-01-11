module "workload_identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version    = "v29.0.0"
  name       = var.name
  namespace  = var.namespace
  project_id = var.project_id
  roles      = var.roles
}

resource "helm_release" "this" {
  depends_on = [module.workload_identity]
  count      = var.app["deploy"] ? 1 : 0
  repository = var.app["repository"]
  name       = var.app["name"]
  chart      = var.app["chart"]
  version    = var.app["version"]

  values = [
    file(var.values)
  ]

  set {
    name  = var.app["path"]
    value = module.workload_identity.k8s_service_account_name
  }

}
