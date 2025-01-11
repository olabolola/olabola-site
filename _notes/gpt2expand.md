---
category:
  - "[Runbooks](Runbooks)"
  - "[Publish](Publish)"
labels:
  - "[EKS](EKS)"
created: 2025-01-11
share: "true"
filename: gpt2expand
title: How to allow volume expansion on gp2 in EKS
---
If you want to be able to expand Persistent Volumes on EKS this setting must be set for the storage class you want to expand. Note that you cannot decrease the size of the persistent volume after expanding it!

Run the following command to get the storage classes available in EKS

```bash
kubectl get storageclass
```


You will see a list of your storage classes and whether or not they allow volume expansion
![Pasted image 20240712175758.png](../attachments/obsidian/Pasted%20image%2020240712175758.png)

If it does not allow volume expansion edit the storage class like so:
```bash
kubectl edit storageclass gp2
```

If you don’t want to use vim then run this instead :) 
```bash
KUBE_EDITOR=nano
kubectl edit storageclass gp2
```

In the text file that opens up you want to set `allowVolumeExpansion: true`. If the attribute already exists then change false to true, and if it doesn’t exist then just add it.

![Pasted image 20240712175857.png](../attachments/obsidian/Pasted%20image%2020240712175857.png)

save the file and get storage classes again. It is now resizeable!
![Pasted image 20240712175909.png](../attachments/obsidian/Pasted%20image%2020240712175909.png)