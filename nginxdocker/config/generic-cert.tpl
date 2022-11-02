{{- /* generic-cert.tpl */ -}}
{{ with secret "pki_cprey_int/issue/j" "common_name=test.cprey.loc" "ttl=10m" }}
{{ .Data.certificate }}
{{ .Data.issuing_ca }}{{ end }}
