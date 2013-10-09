#!/bin/bash

EXCU_SRC="ssh_tunnel_start.sh ssh_tunnel_stop.sh"
EXCU_DEST=/usr/bin

CONF_SRC="ssh_tunnel.conf"
CONF_DEST=/etc

err_quit()
{
    echo "Error: $1"

    exit 1
}

## 检查权限 
if [ 'root' != `id -un` ]; then
    err_quit "You must be root to run it!"
fi


## 安装文件

for f in ${EXCU_SRC}; do
    [ -x $f ] || err_quit "Missing excutive file: $f"
    install -v $f ${EXCU_DEST}
done

for f in ${CONF_SRC}; do
    [ -f $f ] || err_quit "Missing conf file: $f"
    install -v $f ${CONF_DEST}
done

echo "Install completed!"

exit 0
