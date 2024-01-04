module "workload-identity" {
  source     = "../../"
  ca_certificate = "ca-certificate"
  endpoint = "k8s endpoint"
  project_id = "project-id"
}