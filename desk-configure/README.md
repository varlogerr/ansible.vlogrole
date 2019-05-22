Configure desk and installs demo.sh desk  
This role doesn't require desk to be installed

Usage
```
---
# ...
  roles:
  - role: desk-configure
    desk_files: # more desk files to install. defaults to []
    - "{{ playbook_dir + '/extra/more-desk/templates/*.sh' }}"
    desk_fileglobs: # more desk files to install. defaults to []
    - "{{ playbook_dir + '/extra/desk/templates/*.sh' }}"
# ...
```
