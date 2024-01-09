module "terraform_gke_helm_release" {
  source     = "../../"
  name       = "example-name"
  namespace  = "default"
  project_id = "example-project"
  roles      = ["roles/storage.admin", "roles/compute.admin"]
  additional_projects = { "my-gcp-project-name1" : ["roles/storage.admin", "roles/compute.admin"],
  "my-gcp-project-name2" : ["roles/storage.admin", "roles/compute.admin"] }
  chart         = "app"
  repository    = "./repository"
  chart_version = "0.1.0"
  values        = "./repository/values.yaml"
}
