Configure bash

Usage
```
---
# ...
  roles:
  - role: vlog.bash
    bash:
      prompt: true # install custom prompt from templates, optional. defaults to false
# ...
```

dependencies:
- uni.helper-facts
- vlog.myconf
