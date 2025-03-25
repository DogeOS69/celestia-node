{{/*
Determine the image tag based on the network
*/}}
{{- define "celestia-node.imageTag" -}}
{{- if eq .Values.network "celestia" -}}
v0.22.0
{{- else if eq .Values.network "mocha" -}}
v0.22.0-mocha
{{- else if eq .Values.network "arabica" -}}
v0.22.0-arabica
{{- else -}}
{{- fail "Invalid network specified" -}}
{{- end -}}
{{- end -}}
