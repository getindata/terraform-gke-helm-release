variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "roles" {
  description = "A list of roles to be added to the created service account"
  type        = list(string)
  default     = ["roles/storage.admin", "roles/compute.admin"]
}
