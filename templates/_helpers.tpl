{{/*
Expand the name of the chart.
*/}}
{{- define "celestia-node.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "celestia-node.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "celestia-node.labels" -}}
helm.sh/chart: {{ include "celestia-node.chart" . }}
{{ include "celestia-node.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "celestia-node.selectorLabels" -}}
app.kubernetes.io/name: {{ include "celestia-node.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label
*/}}
{{- define "celestia-node.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

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
