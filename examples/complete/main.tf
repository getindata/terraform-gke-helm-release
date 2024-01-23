module "terraform_gke_helm_release" {
  context              = module.this.context
  source               = "../../"
  kubernetes_namespace = "default"
  project_id           = "example-project"
  name                 = "example-name"

  values = [templatefile("./extra-values/values.yaml", {
    replicaCount = 2
  })]

  service_account_value_path = "serviceAccount.name"

  app = {
    name          = "example-name"
    chart         = "nginx"
    repository    = "https://charts.bitnami.com/bitnami"
    version       = "15.6.1"
    force_update  = true
    wait          = false
    recreate_pods = false
  }
}
