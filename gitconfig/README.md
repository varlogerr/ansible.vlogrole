Configure git

Usage
```
---
# ...
  roles:
  - role: gitconfig
    gitconfig_prompt: true # optional. defaults to false
    gitconfig_extraconf: # optional. defaults to {}
      alias:
        log1: log --oneline
        logg: log --oneline -10
      core:
        editor: vim
# ...
```
