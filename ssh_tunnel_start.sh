#!/bin/bash
# 说明: 读取配置文件/etc/ssh_tunnel.conf信息用于启动ssh 反向tunnel
# 配置文件说明: 
# /etc/ssh_tunnel.conf
# 参数说明:
# REMOTE_SSH_USER=root   #远端SSH 连接用户
# REMOTE_SSH_PORT=22     #远端SSH 连接端口
# REMOTE_HOST=rayeye.cn  #远端SSH 连接主机: 注: 如果是域名，确认本机DNS设置可用
# REMOTE_PORT=1234       #远端映射端口
# LOCAL_HOST=127.0.0.1   #本地映射主机
# LOCAL_PORT=22          #本地映射端口
#
#
#




err_quit()
{
    echo "Error: $1"

    exit 1
}

## 检查权限 
if [ 'root' != `id -un` ]; then
    err_quit "You must be root to run it!"
fi

## 配置文件检查
CONF_FILE=/etc/ssh_tunnel.conf

[ -f ${CONF_FILE} ] || err_quit "Missing conf file: ${CONF_FILE}"

source ${CONF_FILE}

eval ssh ${REMOTE_SSH_USER}@${REMOTE_HOST} -p ${REMOTE_SSH_PORT} -NfgR ${REMOTE_PORT}:${LOCAL_HOST}:${LOCAL_PORT}

exit 0
