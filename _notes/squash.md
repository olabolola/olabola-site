---
share: "true"
filename: squash
category:
  - "[Publish](Publish)"
title: Squash a number of local or published commits into a single commit
created: 2024-07-02
---

Sometimes you have pushed a whole bunch of commits and want to create a PR from your branch. The problem is your commits are messy and people will judge you for it when they are reviewing your PR.

This solution allows you to squash all of your published commits before you put your branch into a PR.

```
git checkout my_branch
git reset --soft HEAD~{NUMBER_OF_COMMITS}
git commit
git push --force origin my_branch
```

To count the number of commits in your current branch compared to develop you can do this

```
git rev-list --count develop..HEAD
```
