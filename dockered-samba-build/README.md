```
docker run \
-v /:/data \
-p 445:445 \
-e << ENVS
EVAL_CMD_1="datadir=/data/Share \
  && mkdir -p \${datadir} \
  && chown smbshare:smbshare ${datadir} \
  && chmod 0775 \${datadir}"
EVAL_CMD_2="groupadd -g 1001 app \
  && useradd -u 1001 -g app -G \${SMBSHARE_GROUP} app"
SAMBA_SHARE_Share="[Share]
  available = yes
  path = /data/Share
  guest ok = yes
  force user = app
  force group = sam
  create mask = 0664
  force create mode = 0664
  directory mask = 0775
  force directory mode = 0775"
ENVS \
localhost/samba
```
