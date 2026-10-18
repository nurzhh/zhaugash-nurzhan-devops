# Development branch demonstration

This file was added on the `development` branch as a meaningful documentation change. It records the required branch workflow and remains in the repository after the branch is merged into `main`.

Commands used:

```bash
git switch -c development
git add docs/development-notes.md
git commit -m "Document development branch workflow"
git switch main
git merge development
```
