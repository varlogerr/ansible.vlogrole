Install samba server and configure samba shares

It's not production ready by any means, only for private use in a LAN or virtualbox

Usage
```
---
# ...
  roles:
  - role: vlog.samba-shares
    samba_shares:
      global_template: true # install global template, optional. defaults to false
      shares: # list of shares, optional. defaults to []
      - name: Share # share name, required
        dir: "{{ xfacts.user.homedir }}/Share" # share directory, required
        user: "{{ xfacts.user.name }}" # samba force user, required
        group: "{{ xfacts.user.group }}" # samba force group, required
        file_mode: "0664" # file create mode, must be in quotes, optional. defults to samba defaults
        dir_mode: "0775" # file create mode, must be in quotes, optional. defults to samba defaults
# ...
```

dependencies:
- uni.samba-install
