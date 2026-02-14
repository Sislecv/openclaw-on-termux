#!/bin/bash

# 1. 下载并赋予执行权限（增加错误检查）
echo "正在获取机器人脚本..."
if curl -fSSLo bot.sh https://cdn.jsdelivr.net/gh/Sislecv/openclaw-on-termux@refs/heads/main/bot.sh; then
    chmod +x bot.sh
    echo "脚本下载成功。"
else
    echo "下载失败，请检查网络！"
    exit 1
fi

# 2. 交互式初始化（此步骤通常需要手动输入 Token）
echo "准备进行 OpenClaw 初始化..."
openclaw onboard

# 3. 启动后台服务
echo "正在启动 Dashboard (后台运行)..."
# 使用 nohup 或 & 让面板在后台运行，避免阻塞脚本
nohup openclaw dashboard --no-open > dashboard.log 2>&1 &

# 等待几秒确保面板启动
sleep 2

echo "----------------------------------------------------"
echo "请复制上面的链接并完成 Token 绑定。"
echo "正在启动 Gateway 实时日志..."
echo "----------------------------------------------------"

# 4. 启动网关（放在最后，直接在前台显示 verbose 日志）
openclaw gateway --verbose
