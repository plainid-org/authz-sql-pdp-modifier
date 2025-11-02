# BigQuery Authorizer

A Helm chart for deploying the PlainID BigQuery Authorizer on Kubernetes.

## Introduction

This chart bootstraps a BigQuery Authorizer deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

The BigQuery Authorizer is a service that provides authorization capabilities for Google BigQuery operations, ensuring secure access control based on policies.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.2+

## Installing the Chart

To install the chart with the release name `authz-bigquery`:

```console
helm install authz-bigquery ./deploy/charts/authz-bigquery
```

This command deploys the BigQuery Authorizer on the Kubernetes cluster in the default configuration.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `authz-bigquery` deployment:

```console
helm delete authz-bigquery
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the BigQuery Authorizer chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of replicas | `1` |
| `image.repository` | Image repository | `plainid/authz-bigquery` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `""` |
| `imagePullSecrets` | Image pull secrets | `[]` |
| `nameOverride` | Override the name | `""` |
| `fullnameOverride` | Override the full name | `""` |
| `kubeVersionOverride` | Override Kubernetes version | `""` |
| `serviceAccount.create` | Create service account | `false` |
| `serviceAccount.annotations` | Service account annotations | `{}` |
| `serviceAccount.name` | Service account name | `""` |
| `serviceAccount.automountToken` | Automount service account token | `true` |
| `strategy.rollingUpdate.maxSurge` | Rolling update max surge | `50%` |
| `strategy.rollingUpdate.maxUnavailable` | Rolling update max unavailable | `50%` |
| `annotations` | Deployment annotations | `{}` |
| `env` | Environment variables | `{}` |
| `secret` | Secret environment variables | `{}` |
| `containerPort` | Container port | `8080` |
| `service.enabled` | Enable service | `true` |
| `service.type` | Service type | `ClusterIP` |
| `service.port` | Service port | `8080` |
| `service.protocol` | Service protocol | `TCP` |
| `service.nodePort` | Node port | `""` |
| `service.annotations` | Service annotations | `{}` |
| `debug.enabled` | Enable debug mode | `false` |
| `debug.port` | Debug port | `5005` |
| `metrics.enabled` | Enable metrics | `false` |
| `metrics.port` | Metrics port | `8081` |
| `metrics.serviceMonitor.enabled` | Enable ServiceMonitor | `false` |
| `metrics.serviceMonitor.path` | Metrics path | `/actuator/prometheus` |
| `metrics.serviceMonitor.namespace` | ServiceMonitor namespace | `""` |
| `metrics.serviceMonitor.interval` | Scrape interval | `30s` |
| `metrics.serviceMonitor.labels` | ServiceMonitor labels | `{}` |
| `metrics.serviceMonitor.timeout` | Scrape timeout | `10s` |
| `metrics.annotations` | Metrics annotations | `{}` |
| `metrics.prometheusRule.enabled` | Enable PrometheusRule | `false` |
| `metrics.prometheusRule.additionalLabels` | PrometheusRule labels | `{}` |
| `metrics.prometheusRule.namespace` | PrometheusRule namespace | `""` |
| `metrics.prometheusRule.interval` | Rule evaluation interval | `30s` |
| `metrics.prometheusRule.rules` | Prometheus rules | `[]` |
| `livenessProbe.enabled` | Enable liveness probe | `true` |
| `livenessProbe.initialDelaySeconds` | Liveness probe initial delay | `60` |
| `livenessProbe.periodSeconds` | Liveness probe period | `7` |
| `livenessProbe.timeoutSeconds` | Liveness probe timeout | `5` |
| `livenessProbe.successThreshold` | Liveness probe success threshold | `1` |
| `livenessProbe.failureThreshold` | Liveness probe failure threshold | `6` |
| `readinessProbe.enabled` | Enable readiness probe | `true` |
| `readinessProbe.initialDelaySeconds` | Readiness probe initial delay | `20` |
| `readinessProbe.periodSeconds` | Readiness probe period | `3` |
| `readinessProbe.timeoutSeconds` | Readiness probe timeout | `2` |
| `readinessProbe.successThreshold` | Readiness probe success threshold | `1` |
| `readinessProbe.failureThreshold` | Readiness probe failure threshold | `3` |
| `startupProbe.enabled` | Enable startup probe | `true` |
| `startupProbe.initialDelaySeconds` | Startup probe initial delay | `20` |
| `startupProbe.periodSeconds` | Startup probe period | `3` |
| `startupProbe.timeoutSeconds` | Startup probe timeout | `2` |
| `startupProbe.successThreshold` | Startup probe success threshold | `1` |
| `startupProbe.failureThreshold` | Startup probe failure threshold | `3` |
| `resources` | Resource limits and requests | `{}` |
| `podDisruptionBudget.enabled` | Enable PodDisruptionBudget | `false` |
| `podDisruptionBudget.labels` | PDB labels | `{}` |
| `podDisruptionBudget.annotations` | PDB annotations | `{}` |
| `autoscaling.enabled` | Enable autoscaling | `false` |
| `autoscaling.minReplicas` | Minimum replicas | `3` |
| `autoscaling.maxReplicas` | Maximum replicas | `6` |
| `autoscaling.targetCPUUtilizationPercentage` | CPU utilization target | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Memory utilization target | `80` |
| `autoscaling.annotations` | Autoscaling annotations | `{}` |
| `autoscaling.behavior` | Autoscaling behavior | `{}` |
| `podAnnotations` | Pod annotations | `{}` |
| `podLabels` | Pod labels | `{}` |
| `terminationGracePeriodSeconds` | Termination grace period | `10` |
| `ingress.enabled` | Enable ingress | `false` |
| `ingress.className` | Ingress class name | `""` |
| `ingress.annotations` | Ingress annotations | `{}` |
| `ingress.hosts` | Ingress hosts | `[]` |
| `ingress.tls` | Ingress TLS | `[]` |
| `nodeSelector` | Node selector | `{}` |
| `lifecycle` | Container lifecycle | `{}` |
| `tolerations` | Tolerations | `[]` |
| `podSecurityContext.fsGroup` | Pod security context fsGroup | `2000` |
| `securityContext.readOnlyRootFilesystem` | Read-only root filesystem | `false` |
| `securityContext.runAsNonRoot` | Run as non-root | `true` |
| `securityContext.runAsUser` | Run as user | `1000` |
| `antiAffinity` | Anti-affinity | `"soft"` |
| `weight` | Anti-affinity weight | `1` |
| `antiAffinityTopologyKey` | Anti-affinity topology key | `"kubernetes.io/hostname"` |
| `initContainers` | Init containers | `[]` |
| `dnsPolicy` | DNS policy | `ClusterFirst` |
| `extraVolumes` | Extra volumes | `[]` |
| `extraVolumeMounts` | Extra volume mounts | `[]` |
| `extraContainers` | Extra containers | `[]` |
| `extraDeploy` | Extra deployment objects | `[]` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install authz-bigquery ./deploy/charts/authz-bigquery \
  --set replicaCount=2 \
  --set image.tag=v1.0.0
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install authz-bigquery -f my-values.yaml ./deploy/charts/authz-bigquery
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and Installation Details

### Ingress

This chart provides support for ingress resources. If you have an ingress controller installed on your cluster, such as [nginx-ingress](https://github.com/kubernetes/ingress-nginx) or [traefik](https://github.com/traefik/traefik) you can utilize the ingress controller to serve your BigQuery Authorizer application.

To enable ingress integration, please set `ingress.enabled` to `true`.

### Hosts

Most likely you will only want to have one hostname that maps to this BigQuery Authorizer installation. If that's your case, the property `ingress.hostname` will set it. However, it is possible to have more than one host. To facilitate this, the `ingress.extraHosts` object can be specified as an array. You can also use `ingress.extraTLS` to add the TLS configuration for extra hosts.

For each host indicated at `ingress.hosts`, please indicate a `name`, `path`, and any `annotations` that you may want the ingress controller to know about.

Indicating TLS will cause the application to generate HTTPS URLs, and the application will be connected to at port 443. The actual TLS secret does not have to be generated by this chart. However, please note that if TLS is enabled, the ingress record will not work until this secret exists.

For annotations, please see [this document](https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md). Not all annotations are supported by all ingress controllers, but this document does a good job of indicating which annotation is supported by many popular ingress controllers.

### Metrics

The BigQuery Authorizer exposes metrics at the `/actuator/prometheus` endpoint on port 8081. To enable metrics collection, set `metrics.enabled` to `true`.

If you have Prometheus Operator installed, you can enable ServiceMonitor creation by setting `metrics.serviceMonitor.enabled` to `true`.

### Autoscaling

To enable horizontal pod autoscaling, set `autoscaling.enabled` to `true`. The autoscaler will scale based on CPU and memory utilization.

### Security

The chart runs the container as a non-root user (UID 1000) by default. The pod security context sets fsGroup to 2000.

### Environment Variables

You can pass environment variables to the application using the `env` parameter for regular variables and `secret` for sensitive data stored in Kubernetes secrets.

### Additional Configuration

For additional configuration options, refer to the [values.yaml](values.yaml) file and the application's documentation.

