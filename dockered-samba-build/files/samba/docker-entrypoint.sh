#!/usr/bin/env bash

chown ${SMBSHARE_USER}:${SMBSHARE_GROUP} ${DATA_DIR} \
&& chmod 0775 ${DATA_DIR}

# execute commands
while read var_name; do
  eval_cmd=${!var_name}
  
  eval "${eval_cmd}"
done <<< "$(compgen -e | grep ^EVAL_CMD_ | sort -V)"

# create share configurations
while read var_name; do
  share_name=${var_name:12}
  share_conf=${!var_name}
  custom_conf_path="${SAMBA_CUSTOM_CONF_DIR}/${share_name}.conf"

  echo "${share_conf}" | tee "${custom_conf_path}"
  echo "include = ${custom_conf_path}" | tee -a ${SAMBA_CONF}
done <<< "$(compgen -e | grep ^SAMBA_SHARE_ | sort -V)"

service nmbd start
smbd -FS < /dev/null
