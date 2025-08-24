{{/*
Expand the name of the chart.
*/}}
{{- define "porigins-server-cpp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "porigins-server-cpp.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "porigins-server-cpp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "porigins-server-cpp.labels" -}}
helm.sh/chart: {{ include "porigins-server-cpp.chart" . }}
{{ include "porigins-server-cpp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "porigins-server-cpp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "porigins-server-cpp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "porigins-server-cpp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "porigins-server-cpp.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
MySQL connection string
*/}}
{{- define "porigins-server-cpp.mysqlHost" -}}
{{- if .Values.mysql.enabled }}
{{- printf "%s-mysql" .Release.Name }}
{{- else }}
{{- .Values.externalDatabase.host }}
{{- end }}
{{- end }}

{{/*
MySQL port
*/}}
{{- define "porigins-server-cpp.mysqlPort" -}}
{{- if .Values.mysql.enabled }}
{{- .Values.mysql.primary.service.ports.mysql | default 3306 }}
{{- else }}
{{- .Values.externalDatabase.port | default 3306 }}
{{- end }}
{{- end }}

{{/*
MySQL database name
*/}}
{{- define "porigins-server-cpp.mysqlDatabase" -}}
{{- if .Values.mysql.enabled }}
{{- .Values.mysql.auth.database | default "forgottenserver" }}
{{- else }}
{{- .Values.externalDatabase.database }}
{{- end }}
{{- end }}

{{/*
MySQL username
*/}}
{{- define "porigins-server-cpp.mysqlUser" -}}
{{- if .Values.mysql.enabled }}
{{- .Values.mysql.auth.username | default "forgottenserver" }}
{{- else }}
{{- .Values.externalDatabase.username }}
{{- end }}
{{- end }}
