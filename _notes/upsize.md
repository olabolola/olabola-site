---
share: "true"
filename: upsize
category:
  - "[[Publish|Publish]]"
  - "[[Runbooks|Runbooks]]"
labels:
  - "[[Ubuntu|Ubuntu]]"
  - "[[Dual Boot|Dual Boot]]"
  - "[[Windows|Windows]]"
created: 2024-07-01
title: How to increase the size of the Ubuntu partition on Windows dual boot
---

- [Create a bootable USB for Ubuntu](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu)
- Shrink the size of the windows partition using dskmgmt.
- Boot up Ubuntu from the USB.
- Open up GParted.
- Extend the Ubuntu partition into the space you just stole from the windows partition.
- That is all :)
