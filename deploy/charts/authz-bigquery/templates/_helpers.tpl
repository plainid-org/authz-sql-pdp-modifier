{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "authz-bigquery.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "authz-bigquery.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "authz-bigquery.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "authz-bigquery.labels" -}}
app: {{ include "authz-bigquery.chart" . }}
helm.sh/chart: {{ include "authz-bigquery.chart" . }}
{{ include "authz-bigquery.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "authz-bigquery.selectorLabels" -}}
app.kubernetes.io/name: {{ include "authz-bigquery.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
namespace: {{ .Release.Namespace | quote }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "authz-bigquery.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "authz-bigquery.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the target Kubernetes version
*/}}
{{- define "authz-bigquery.kubeVersion" -}}
  {{- default .Capabilities.KubeVersion.Version .Values.kubeVersionOverride }}
{{- end -}}

{{/*
Return the appropriate apiVersion for pod disruption budget
*/}}
{{- define "authz-bigquery.podDisruptionBudget.apiVersion" -}}
{{- if semverCompare "<1.21-0" (include "authz-bigquery.kubeVersion" $) -}}
{{- print "policy/v1beta1" -}}
{{- else -}}
{{- print "policy/v1" -}}
{{- end -}}
{{- end -}}







