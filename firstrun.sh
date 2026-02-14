#!/bin/bash

# 环境清理
pkill -f "openclaw" > /dev/null 2>&1

echo "================================================"
echo "          OpenClaw Termux 首次运行引导          "
echo "================================================"

# 步骤 1: 基础初始化
openclaw onboard

# 步骤 2: 深度预热网关
echo "👉 正在进行网关预初始化，请稍候..."
openclaw gateway --verbose & 
GATEWAY_PRE_PID=$!

for i in {15..1}; do
    echo -ne "   ⏳ 剩余 $i 秒...\r"
    sleep 1
done
echo -e "\n✅ 网关环境初始化完成。"
kill $GATEWAY_PRE_PID > /dev/null 2>&1

# 步骤 3: 启动 Dashboard 获取链接
echo ""
echo "👉 正在启动 Dashboard 以获取绑定链接..."
echo "------------------------------------------------"
echo "⚠️  请在下方输出中寻找包含 'token=' 的链接并复制"
echo "------------------------------------------------"
sleep 2
openclaw dashboard --no-open &
DASH_PID=$!

# 步骤 4: 等待用户复制
echo ""
read -p "✅ 复制完成后，请按 [Enter] 回车键：关闭面板并下载启动脚本..."

# 步骤 5: 关闭面板并下载 bot.sh
kill $DASH_PID > /dev/null 2>&1
echo "------------------------------------------------"
echo "📂 正在下载日常启动脚本 bot.sh..."
if curl -fSSLo bot.sh https://cdn.jsdelivr.net/gh/Sislecv/openclaw-on-termux@refs/heads/main/bot.sh; then
    chmod +x bot.sh
    echo "✅ bot.sh 下载并授权成功。"
else
    echo "❌ bot.sh 下载失败，请检查网络。"
fi

echo "------------------------------------------------"
echo "🆗 即将正式启动 Gateway..."
echo "------------------------------------------------"
sleep 1

# 步骤 6: 正式运行
openclaw gateway --verbose
