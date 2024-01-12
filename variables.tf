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
  description = "An application to deploy with specific values Here you can specify: The name of the application to deploy,Chart name, Repository address, Chart version"
  type = object({
    name                       = string
    chart                      = string
    repository                 = optional(string, null)
    version                    = optional(string, null)
    force_update               = optional(bool, true)
    wait                       = optional(bool, true)
    recreate_pods              = optional(bool, true)
    max_history                = optional(number, 0)
    lint                       = optional(bool, true)
    cleanup_on_fail            = optional(bool, false)
    create_namespace           = optional(bool, false)
    disable_webhooks           = optional(bool, false)
    verify                     = optional(bool, false)
    reuse_values               = optional(bool, false)
    reset_values               = optional(bool, false)
    atomic                     = optional(bool, false)
    skip_crds                  = optional(bool, false)
    render_subchart_notes      = optional(bool, true)
    disable_openapi_validation = optional(bool, false)
    wait_for_jobs              = optional(bool, false)
    dependency_update          = optional(bool, false)
    replace                    = optional(bool, false)
    timeout                    = optional(number, 300)
  })
}

variable "values" {
  description = "Extra values"
  type        = list(string)
  default     = []
}
variable "service_account_value_path" {
  description = "Path to ServiceAccount value in values.yaml"
  type        = string
}
variable "kubernetes_namespace" {
  description = "Namespace where kubernetes SA will be applyed"
  type        = string
}
variable "set" {
  description = "Value block with custom STRING values to be merged with the values yaml."
  type = list(object({
    name  = string
    value = string
  }))
  default = null
}

variable "set_sensitive" {
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff."
  type = list(object({
    path  = string
    value = string
  }))
  default = null
}
variable "descriptor_name" {
  description = "Name of the descriptor used to form a resource name"
  type        = string
  default     = "gcp-service-account"
}
