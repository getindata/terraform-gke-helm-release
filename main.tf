module "workload_identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version    = "v29.0.0"
  name       = var.name
  namespace  = var.namespace
  project_id = var.project_id
  roles      = var.roles
}

module "jenkins" {
  source  = "terraform-module/release/helm"
  version = "2.8.1"

  namespace  = var.namespace
  repository = "https://charts.helm.sh/stable"
  app = {
    name          = "jenkins"
    version       = "1.5.0"
    chart         = "jenkins"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }
}
