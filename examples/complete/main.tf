module "terraform_gke_helm_release" {
  source     = "../../"
  namespace  = "default"
  project_id = "example-project"
  repository = "./test-chart"
  values     = "./test-chart/values.yaml"

  app = {
    name          = "example-name"
    version       = "1.0.0"
    chart         = "app"
    path          = "serviceAccount.name"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }
}
