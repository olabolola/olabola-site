---
category:
  - "[Runbooks](Runbooks)"
  - "[Publish](Publish)"
labels:
  - "[regex](regex)"
created: 2025-01-11
share: "true"
filename: removemdsuffix
title: Regex to remove md suffix in markdown links
---
Replace this:
```
(\[[^\]]*\]\([^\)]*?)\.md\)
```

With this:
```
$1)
```

So, these four:
1) `[asd](qwe.md)`
2) `[as d](qwe.md)`
3) `[as d](qw e.md)`
4) `[asd](qw e.md)`

Will be transformed into these four respectively
1) `[asd](qwe)`
2) `[as d](qwe)`
3) `[as d](qw e)`
4) `[asd](qw e)`