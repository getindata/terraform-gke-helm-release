config {
  ignore_module = {
    "terraform-google-modules/kubernetes-engine/google//modules/workload-identity" = true
    "terraform-module/release/helm" = true
  }
}
plugin "terraform" {
    enabled = true
    version = "0.5.0"
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
    preset  = "all"
}

rule "terraform_standard_module_structure" {
  enabled = false  # Fails on context.tf
}
