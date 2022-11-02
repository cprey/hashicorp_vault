{{- /* yet-cert.tpl */ -}}
{{ with secret "pki_int/issue/yet-dot-org" "common_name=<NGINX_FQDN>" "ttl=10m" }}
{{ .Data.certificate }}
{{ .Data.issuing_ca }}{{ end }}
