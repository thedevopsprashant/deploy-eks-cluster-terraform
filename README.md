# Deploy Production Ready EKS Cluster Using Terraform

This Project TODO.

## EKS Cluster Setup
```bash
aws configure
aws sts get-caller-identity
```

## Terraform Apply
```bash
tf apply -var-file=dev.tfvars -auto-approve
```

## Install EKS Addons version check
```bash
helm repo add eks https://aws.github.io/eks-charts
helm repo update eks
helm search repo eks/aws-load-balancer-controller --versions
helm list -A
```

## Install EKS Addons argo-cd version check
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argo/argo-cd --versions
helm list -A
```

## Install EKS Addons prometheus version check
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update prometheus-community
helm search repo prometheus-community/kube-prometheus-stack --versions
helm list -A
```

## Update the kubeconfig
```bash
aws eks update-kubeconfig --name testing-my-cluster --region ap-south-1
```

## Get the argocd server url
```bash
kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname'
```

## Get the argocd admin password
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Get the prometheus admin password
```bash
kubectl get secret --namespace prometheus prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

## Get the prometheus grafana image
```bash
helm list -n prometheus
kubectl get pods -n prometheus -l app.kubernetes.io/name=grafana -o jsonpath='{.items[*].spec.containers[*].image}'
```

## Reset the prometheus grafana admin password
```bash
kubectl exec --namespace prometheus -it $(kubectl get pods --namespace prometheus -l app.kubernetes.io/name=grafana -o jsonpath="{.items[0].metadata.name}") -- grafana-cli admin reset-admin-password Abcd@1234
```

## Delete the Deployments
```bash
kubectl delete -f .
```

## Destroy the infrastructure
```bash
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars" -auto-approve
terraform destroy -var-file="dev.tfvars" -auto-approve

eksctl delete cluster --name testing-my-cluster --region ap-south-1


terraform destroy -var-file="stage.tfvars" -auto-approve
terraform destroy -var-file="prod.tfvars" -auto-approve
```