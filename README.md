# Summary

This terraform module creates a `DOKS` cluster and deploys broken app to it. The challenge is to fix the app to make it run.

## Usage

```bash
export DIGITALOCEAN_ACCESS_TOKEN=<your token>
terraform init
terraform apply
```

The module will create a kubeconfig file in the current directory. The file name will start with `kubeconfig-` You can use it to access the cluster using `kubectl`

```bash
export KUBECONFIG=./kubeconfig-<cluster name>
kubectl get nodes
```

By default one cluster will be created. You can change the number of clusters by setting the `cluster_count` variable.
