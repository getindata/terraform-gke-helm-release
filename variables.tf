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
  description = "an application to deploy"
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
  description = "Extra values"
  type        = string
}
