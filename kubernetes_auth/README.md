https://www.vaultproject.io/docs/auth/kubernetes

```console
vault auth enable kubernetes
```

```console
vault write auth/kubernetes/config \
    token_reviewer_jwt="default" \
    kubernetes_host=https://192.168.64.2:8443 \
    kubernetes_ca_cert=@/Users/cprey/.minikube/ca.crt
```

look at Kubeconfig to pull these values.
