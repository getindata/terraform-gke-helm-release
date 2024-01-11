module "terraform_gke_helm_release" {
  source     = "../../"
  namespace  = "default"
  project_id = "example-project"
  values     = "extra-values/values.yaml"

  app = {
    name          = "example-name"
    chart         = "nginx"
    path          = "serviceAccount.name"
    repository    = "https://charts.bitnami.com/bitnami"
    version       = "15.6.1"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }
}
