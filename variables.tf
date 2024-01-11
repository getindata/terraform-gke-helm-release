variable "roles" {
  description = "A list of roles to be added to the created service account"
  type        = list(string)
  default     = []
}
variable "project_id" {
  description = "GCP project ID"
  type        = string
}
variable "app" {
  description = "An application to deploy with specific values Here you can specify: The name of the application to deploy,Chart name, Repository address, Chart version and path to ServiceAccount value in values.yaml"
  type        = map(any)
  default = {
    deploy     = true
    name       = null
    chart      = null
    repository = null
    version    = null
    path       = null
  }
}
variable "values" {
  description = "Chart extra values"
  type        = string
}
