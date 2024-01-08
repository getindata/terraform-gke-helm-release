module "terraform_gke_helm_release" {
  source     = "../../"
  name       = "example"
  namespace  = "default"
  project_id = "example-project"
}
