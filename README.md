#GKE Helm release module

<!--- Pick Cloud provider Badge -->
<!---![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white) -->
![Google Cloud](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)
<!---![Snowflake](https://img.shields.io/badge/-SNOWFLAKE-249edc?style=for-the-badge&logo=snowflake&logoColor=white) -->
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

<!--- Replace repository name -->
![License](https://badgen.net/github/license/getindata/terraform-gke-helm-release/)
![Release](https://badgen.net/github/release/getindata/terraform-gke-helm-release/)

<p align="center">
  <img height="150" src="https://getindata.com/img/logo.svg">
  <h3 align="center">We help companies turn their data into assets</h3>
</p>

---

Workload Identity is the recommended way to access GCP services from Kubernetes.

This module creates:

* IAM Service Account binding to roles/iam.workloadIdentityUser
* Optionally, a Google Service Account
* Optionally, a Kubernetes Service Account

> **Warning**:
> _When using "Invicton-Labs/deepmerge/null" module - pin `tflint` version to `v0.41.0` in [pre-commit.yaml](.github/workflows/pre-commit.yml) to avoid failing `tflint` checks_

## USAGE
The terraform-google-workload-identity can create service accounts for you, or you can use existing accounts; this applies for both the Google and Kubernetes accounts.

```terraform
module "workload-identity" {
  source     = "getindata/terraform-gke-helm-release"
  name       = "my-application-name"
  namespace  = "default"
  project_id = "my-gcp-project-name"
  roles      = ["roles/storage.admin", "roles/compute.admin"]
}
}
```

## NOTES

_Additional information that should be made public, for ex. how to solve known issues, additional descriptions/suggestions_

## EXAMPLES

- [Simple](examples/simple) - Basic usage of the module
- [Complete](examples/complete) - Advanced usage of the module

<!-- BEGIN_TF_DOCS -->




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_projects"></a> [additional\_projects](#input\_additional\_projects) | A list of roles to be added to the created service account for additional projects | `map(list(string))` | `{}` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_annotate_k8s_sa"></a> [annotate\_k8s\_sa](#input\_annotate\_k8s\_sa) | Annotate the kubernetes service account with 'iam.gke.io/gcp-service-account' annotation. Valid in cases when an existing SA is used. | `bool` | `true` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_automount_service_account_token"></a> [automount\_service\_account\_token](#input\_automount\_service\_account\_token) | Enable automatic mounting of the service account token | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name. Required if using existing KSA. | `string` | `""` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_gcp_sa_name"></a> [gcp\_sa\_name](#input\_gcp\_sa\_name) | Name for the Google service account; overrides `var.name`. | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_impersonate_service_account"></a> [impersonate\_service\_account](#input\_impersonate\_service\_account) | An optional service account to impersonate for gcloud commands. If this service account is not specified, the module will use Application Default Credentials. | `string` | `""` | no |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Name for the Kubernetes service account; overrides `var.name`. `cluster_name` and `location` must be set when this input is specified. | `string` | n/a | yes |
| <a name="input_k8s_sa_project_id"></a> [k8s\_sa\_project\_id](#input\_k8s\_sa\_project\_id) | GCP project ID of the k8s service account; overrides `var.project_id`. | `string` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Cluster location (region if regional cluster, zone if zonal cluster). Required if using existing KSA. | `string` | `""` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources to depend on before annotating KSA. If multiple, all items must be the same type. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | A list of roles to be added to the created service account | `list(string)` | `[]` | no |
| <a name="input_skip_download"></a> [skip\_download](#input\_skip\_download) | Whether to skip downloading gcloud (assumes gcloud and kubectl is already available outside the module) | `bool` | `false` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_use_existing_context"></a> [use\_existing\_context](#input\_use\_existing\_context) | An optional flag to use local kubectl config context. | `bool` | `false` | no |
| <a name="input_use_existing_gcp_sa"></a> [use\_existing\_gcp\_sa](#input\_use\_existing\_gcp\_sa) | Use an existing Google service account instead of creating one | `bool` | `false` | no |
| <a name="input_use_existing_k8s_sa"></a> [use\_existing\_k8s\_sa](#input\_use\_existing\_k8s\_sa) | Use an existing kubernetes service account instead of creating one | `bool` | `false` | no |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_annotate_sa"></a> [annotate\_sa](#module\_annotate\_sa) | terraform-google-modules/gcloud/google//modules/kubectl-wrapper | ~> 3.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp_service_account"></a> [gcp\_service\_account](#output\_gcp\_service\_account) | GCP service account. |
| <a name="output_gcp_service_account_email"></a> [gcp\_service\_account\_email](#output\_gcp\_service\_account\_email) | Email address of GCP service account. |
| <a name="output_gcp_service_account_fqn"></a> [gcp\_service\_account\_fqn](#output\_gcp\_service\_account\_fqn) | FQN of GCP service account. |
| <a name="output_gcp_service_account_name"></a> [gcp\_service\_account\_name](#output\_gcp\_service\_account\_name) | Name of GCP service account. |
| <a name="output_k8s_service_account_name"></a> [k8s\_service\_account\_name](#output\_k8s\_service\_account\_name) | Name of k8s service account. |
| <a name="output_k8s_service_account_namespace"></a> [k8s\_service\_account\_namespace](#output\_k8s\_service\_account\_namespace) | Namespace of k8s service account. |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.84.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.24.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.84.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.24.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.workload_identity_sa_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.workload_identity_sa_bindings_additional_projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.cluster_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [kubernetes_service_account.main](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [google_service_account.cluster_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |
<!-- END_TF_DOCS -->

## CONTRIBUTING

Contributions are very welcomed!

Start by reviewing [contribution guide](CONTRIBUTING.md) and our [code of conduct](CODE_OF_CONDUCT.md). After that, start coding and ship your changes by creating a new PR.

## LICENSE

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.

## AUTHORS

<!--- Replace repository name -->
<a href="https://github.com/getindata/REPO_NAME/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=getindata/terraform-module-template" />
</a>

Made with [contrib.rocks](https://contrib.rocks).
