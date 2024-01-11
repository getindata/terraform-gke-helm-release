module "terraform_gke_helm_release" {
  source     = "../../"
  namespace  = "default"
  project_id = "example-project"
  values     = "test-chart/values.yaml"

  app = {
    name          = "example-name"
    chart         = "./test-chart"
    path          = "serviceAccount.name"
    repository    = null
    version       = null
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }
}
