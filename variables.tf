variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_sa_name" {
  description = "Name for the Google service account; overrides `var.name`."
  type        = string
  default     = null
}

variable "use_existing_gcp_sa" {
  description = "Use an existing Google service account instead of creating one"
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "Cluster name. Required if using existing KSA."
  type        = string
  default     = ""
}

variable "location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster). Required if using existing KSA."
  type        = string
  default     = ""
}

variable "k8s_sa_name" {
  description = "Name for the Kubernetes service account; overrides `var.name`. `cluster_name` and `location` must be set when this input is specified."
  type        = string
  default     = ""
}

variable "k8s_sa_project_id" {
  description = "GCP project ID of the k8s service account; overrides `var.project_id`."
  type        = string
  default     = null
}

variable "use_existing_k8s_sa" {
  description = "Use an existing kubernetes service account instead of creating one"
  type        = bool
  default     = false
}

variable "annotate_k8s_sa" {
  description = "Annotate the kubernetes service account with 'iam.gke.io/gcp-service-account' annotation. Valid in cases when an existing SA is used."
  type        = bool
  default     = true
}

variable "automount_service_account_token" {
  description = "Enable automatic mounting of the service account token"
  type        = bool
  default     = false
}

variable "roles" {
  description = "A list of roles to be added to the created service account"
  type        = list(string)
  default     = []
}

variable "impersonate_service_account" {
  description = "An optional service account to impersonate for gcloud commands. If this service account is not specified, the module will use Application Default Credentials."
  type        = string
  default     = ""
}

variable "use_existing_context" {
  description = "An optional flag to use local kubectl config context."
  type        = bool
  default     = false
}

variable "skip_download" {
  description = "Whether to skip downloading gcloud (assumes gcloud and kubectl is already available outside the module)"
  type        = bool
  default     = true
}

variable "module_depends_on" {
  description = "List of modules or resources to depend on before annotating KSA. If multiple, all items must be the same type."
  type        = list(any)
  default     = []
}

variable "additional_projects" {
  description = "A list of roles to be added to the created service account for additional projects"
  type        = map(list(string))
  default     = {}
}
