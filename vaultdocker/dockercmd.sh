docker run -p 8200:8200 -v "$(pwd)"/file:/vault/file --cap-add=IPC_LOCK -e 'VAULT_LOCAL_CONFIG={"disable_mlock": true,"listener": {"tcp": {"address": "0.0.0.0:8200","tls_disable": true}},"backend": {"file": {"path": "/vault/file"}}, "default_lease_ttl": "168h", "max_lease_ttl": "720h","api_addr": "http://0.0.0.0:8200","ui": true}' vault server