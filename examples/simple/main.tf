module "terraform_gke_helm_release" {
  source        = "../../"
  name          = "example-name"
  namespace     = "default"
  project_id    = "example-project"
  chart         = "app"
  repository    = "./repository"
  chart_version = "0.1.0"
  values        = "./repository/values.yaml"
}
