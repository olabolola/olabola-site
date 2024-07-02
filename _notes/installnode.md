---
filename: installnode
share: "true"
category:
  - "[Publish](Publish)"
  - "[Runbooks](Runbooks)"
labels:
  - "[NodeJS](NodeJS)"
  - "[NPM](NPM)"
  - "[Ubuntu](Ubuntu)"
  - "[OSx](OSx)"
created: 2024-07-01
title: How to install node and npm
---

### Step 1: Install a node version manager. We will use `nvm`. This is for OSx and Linux only.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

### Step 2: Run

```bash
nvm install node
```

to get the latest node release.

You can specify a node version by

```bash
nvm install 12
```

### Step 3: select which node version you want to use with

```bash
nvm use 12
```

Sources:

- https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
- https://github.com/nvm-sh/nvm
