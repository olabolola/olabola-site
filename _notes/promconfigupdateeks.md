---
labels:
  - "[EKS](EKS)"
  - "[Prometheus](Prometheus)"
category:
  - "[Runbooks](Runbooks)"
  - "[Publish](Publish)"
created: 2025-01-11
share: "true"
filename: promconfigupdateeks
title: How to apply new config to Prometheus on EKS
---
Find the config map you want to edit:
```bash
kubectl get configmap -n monitoring
```

If you wish to edit with nano then set the env var
```bash
export KUBE_EDITOR="nano"
```

Edit the config map
```bash
kubectl edit configmap prometheus-server -n monitoring
```

> [!example]- Put this inside it (or whatever else you want):
> ```yaml
> - job_name: spark-job-metrics
>   honor_labels: true
>   honor_timestamps: true
>   scrape_interval: 15s  # Adjust the scrape interval as needed
>   scrape_timeout: 10s
>   metrics_path: /metrics
>   scheme: http
>   follow_redirects: true
>   enable_http2: true
>   relabel_configs:
>   - source_labels: [__meta_kubernetes_namespace]
>     separator: ;
>     regex: emr-workspace
>     action: keep
>   - source_labels: [__meta_kubernetes_service_name]
>     separator: ;
>     regex: spark-job-metrics
>     action: keep
>   - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scheme]
>     separator: ;
>     regex: (https?)
>     target_label: __scheme__
>     replacement: $1
>     action: replace
>   - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_path]
>     separator: ;
>     regex: (.+)
>     target_label: __metrics_path__
>     replacement: $1
>     action: replace
>   - source_labels: [__address__, __meta_kubernetes_service_annotation_prometheus_io_port]
>     separator: ;
>     regex: (.+?)(?::\d+)?;(\d+)
>     target_label: __address__
>     replacement: $1:$2
>     action: replace
>   - separator: ;
>     regex: __meta_kubernetes_service_annotation_prometheus_io_param_(.+)
>     replacement: __param_$1
>     action: labelmap
>   - separator: ;
>     regex: __meta_kubernetes_service_label_(.+)
>     replacement: $1
>     action: labelmap
>   - source_labels: [__meta_kubernetes_namespace]
>     separator: ;
>     regex: (.*)
>     target_label: namespace
>     replacement: $1
>     action: replace
>   - source_labels: [__meta_kubernetes_service_name]
>     separator: ;
>     regex: (.*)
>     target_label: service
>     replacement: $1
>     action: replace
>   - source_labels: [__meta_kubernetes_pod_node_name]
>     separator: ;
>     regex: (.*)
>     target_label: node
>     replacement: $1
>     action: replace
>   kubernetes_sd_configs:
>   - role: endpoints
>     kubeconfig_file: ""
>     follow_redirects: true
>     enable_http2: true
> ```

Restart Prometheus. If you have deployed as a stateful set then you can restart like this: ![How to restart a Kubernetes StatefulSet](How%20to%20restart%20a%20Kubernetes%20StatefulSet)
