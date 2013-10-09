#!/bin/bash
# 说明: 停止基于配置文件/etc/ssh_tunnel.conf建立的ssh反向隧道


err_quit()
{
    echo "Error: $1"

    exit 1
}

## 检查权限 
if [ 'root' != `id -un` ]; then
    err_quit "You must be root to run it!"
fi



PID=$(ps aux|grep ssh|grep NfgR|awk '{print $2}')

if [ "_" != "_$PID" ]; then
    kill -9 $PID

    if [ $? -eq 0 ]; then
        echo "Stop SSH tunnel: success!"
    else
        echo "Stop SSH tunnel: failed!"
    fi

else
    echo "SSH tunnel doesn't exist."

fi


exit 0
