#!/bin/bash

termux-change-repo
termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install proot nodejs-lts python make build-essential git curl -y

echo "基础依赖安装完成..."

# 2. 安装 openclaw
# 使用 --location 确保 npm 路径正确
npm install -g openclaw@latest --registry=https://registry.npmmirror.com

# 3. 下载 firstrun.sh (注意参数大小写 -fSSLo)
echo "正在从 CDN 下载启动脚本..."
curl -fSSLo firstrun.sh https://cdn.jsdelivr.net/gh/Sislecv/openclaw-on-termux@refs/heads/main/firstrun.sh

# 4. 验证下载是否成功
if [ -f "firstrun.sh" ]; then
    chmod +x firstrun.sh
    echo "----------------------------------------------------"
    echo "安装完成！"
    echo "请执行以下命令进入环境并运行："
    echo "termux-chroot"
    echo "bash firstrun.sh"
    echo "----------------------------------------------------"
else
    echo "错误：firstrun.sh 下载失败，请检查网络连接或手动执行 curl -fSSLo firstrun.sh https://raw.githubusercontent.com/Sislecv/openclaw-on-termux/refs/heads/main/firstrun.sh"
    exit 1
fi
