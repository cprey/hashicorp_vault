# Vault PKI Autoenrollment with Vault Template

## Create a local vault using Containers

```console
docker run -p 8200:8200 -v "$(pwd)"/file:/vault/file --cap-add=IPC_LOCK -e 'VAULT_LOCAL_CONFIG={"disable_mlock": true,"listener": {"tcp": {"address": "0.0.0.0:8200","tls_disable": true}},"backend": {"file": {"path": "/vault/file"}}, "default_lease_ttl": "168h", "max_lease_ttl": "720h","api_addr": "http://0.0.0.0:8200","ui": true}' vault server```

## Logging in to _this_ vault

```console
export VAULT_ADDR=http://localhost:8200
```

This is useful if the systems are local or on a low-latency network. Vault agent is the *plain old* vault binary running as a daemon.

1. Create the AppRole

    ```console
    curl \
        --header "X-Vault-Token: $RVT" \
        --request POST \
        --data '{"policies": "certifiable"}' \
        http://127.0.0.1:8200/v1/auth/approle/role/pki-testrole
    ```

1. Get the SecretID

    ```console
    curl \
    --header "X-Vault-Token: $RVT" \
    --request POST \
        http://127.0.0.1:8200/v1/auth/approle/role/pki-testrole/secret-id
    ```

    Take the AppRoleID and the SecretID and place them into files [secretid](nginxdocker/config/secretid) and [roleid](nginxdocker/config/roleid)

1. Create the Policy `certifiable`

    I tacked this snippet onto the policy `default`. Much can be trimmed out later.

    ```console
    path "pki_cprey_int/issue/certifiable" {
        capabilities = ["create", "read", "update", "delete", "list"]
    }
    ```

1. The Template and configuration files

    - [Vault agent configuration](nginxdocker/config/vaulttemplate.ctmpl)
    nothing much needs pointing out.
    - [Vault template - cert](nginxdocker/config/generic-cert.tpl) and [Vault template - key](nginxdocker/config/generic-key.tpl) use the PKI role `certifiable` the path to it is...

    ```console
    with secret "pki_cprey_int/issue/certifiable"
    ```
