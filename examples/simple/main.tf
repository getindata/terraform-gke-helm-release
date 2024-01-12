module "terraform_gke_helm_release" {
  source               = "../../"
  kubernetes_namespace = "default"
  project_id           = "example-project"
  name                 = "example-name"
  values = [
    file("./test-chart/values.yaml")
  ]
  service_account_value_path = "serviceAccount.name"

  app = {
    name          = "example-name"
    chart         = "./test-chart"
    repository    = null
    version       = null
    force_update  = true
    wait          = false
    recreate_pods = false
  }
}
