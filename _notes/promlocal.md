---
labels:
  - "[Prometheus](Prometheus)"
  - "[Kubernetes](Kubernetes)"
  - "[kubectl](kubectl)"
category:
  - "[Runbooks](Runbooks)"
  - "[Publish](Publish)"
created: 2025-01-11
share: "true"
filename: promlocal
title: How to open up Prometheus locally using kubectl
---
Get the pods in the namespace in which Prometheus is installed
```bash
kubectl get pods -n monitoring
```

Port-forward the Prometheus server
```bash
kubectl port-forward -n monitoring prometheus-server-xxxxxxxx-xxxx 9090:9090
```

You can now access Prometheus through your browser: 
```
http://localhost:9090
```