module "workload_identity" {
  count      = module.this.enabled ? 1 : 0
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version    = "30.0.0"
  name       = local.name_from_descriptor
  namespace  = var.kubernetes_namespace
  project_id = var.project_id
  roles      = var.roles
}

resource "helm_release" "this" {
  count      = module.this.enabled ? 1 : 0
  repository = var.app.repository
  name       = var.app.name
  chart      = var.app.chart
  version    = var.app.version
  namespace  = var.kubernetes_namespace

  values = var.values

  dynamic "set" {
    iterator = item
    for_each = var.set == null ? [] : var.set

    content {
      name  = item.value.name
      value = item.value.value
    }
  }

  dynamic "set_sensitive" {
    iterator = item
    for_each = var.set_sensitive == null ? [] : var.set_sensitive

    content {
      name  = item.value.path
      value = item.value.value
    }
  }

  set {
    name  = var.service_account_value_path
    value = module.workload_identity[0].k8s_service_account_name
  }
}
