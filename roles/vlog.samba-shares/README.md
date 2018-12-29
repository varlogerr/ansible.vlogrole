Configure samba shares

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
        dir: "{{ ansible_user_dir }}/Share" # share directory, required
        user: "{{ ansible_user_id }}" # samba force user, required
        group: "{{ ansible_user_id }}" # samba force group, required
        file_mode: "0664" # file create mode, must be in quotes, optional. defults to samba defaults
        dir_mode: "0775" # file create mode, must be in quotes, optional. defults to samba defaults
# ...
```
