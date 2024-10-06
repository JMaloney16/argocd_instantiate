ArgoCD K8S Terraform Module
===========

A Terraform module to instantiate ArgoCD from the official repo within a Kubernetes cluster.

Module Input Variables
----------------------

- `host` - The name of the K8S cluster.
- `token` - The kubeconfig authentication token.
- `insecure` - Validate certificates boolean.
- `argocd_password` - The password to assign to the `admin` user in ArgoCD.

- `argocd_version`(optional) - The version of the argo-cd chart to use.

The `argocd_password` should be provided as a bcrypt hashed string, this can be generated with ```htpasswd -nbBC 10 "" $ARGO_PWD | tr -d ':\n' | sed 's/$2y/$2a/'``` where $ARGO_PWD is the password in plain text.

Usage
-----

```hcl
module "demo" {
  source = "github.com/jmaloney16/argocd_inst"

  host     = module.primaryInstance.kubeconfig_host
  token    = module.primaryInstance.kubeconfig_token
  insecure = module.primaryInstance.kubeconfig_insecure

  argocd_version = var.argocd_version
  argocd_password = var.argocd_password
}
```

Outputs
=======

None, yet.

Authors
=======

Jack Maloney
