---
category:
  - "[Runbooks](Runbooks)"
  - "[Publish](Publish)"
labels:
  - "[EKS](EKS)"
  - "[Kubernetes](Kubernetes)"
created: 2025-03-19
share: "true"
filename: restartkubess
title: How to restart a Kubernetes StatefulSet
---
First identify the stateful set
```bash
kubectl get statefulsets -n monitoring
```

Then restart it:
```bash
kubectl rollout restart statefulset <statefulset-name> -n monitoring
```