{{- /* yet-key.tpl */ -}}
{{ with secret "pki_int/issue/yet-dot-org" "common_name=<NGINX_FQDN>" "ttl=10m"}}
{{ .Data.private_key }}{{ end }}
