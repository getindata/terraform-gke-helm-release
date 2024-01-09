variable "roles" {
  description = "A list of roles to be added to the created service account"
  type        = list(string)
  default     = []
}
variable "project_id" {
  description = "GCP project ID"
  type        = string
}
variable "repository" {
  description = "Helm repository"
  type        = string
}
variable "app" {
  description = "an application to deploy"
  type        = map(any)
}
variable "values" {
  description = "Extra values"
  type        = string
}
