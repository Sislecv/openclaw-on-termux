#!/bin/bash

# 环境清理
pkill -f "openclaw" > /dev/null 2>&1

# 步骤 1: 快速预热网关
echo "🔄 正在预热网关环境..."
openclaw gateway --verbose &
GATEWAY_PRE_PID=$!

# 日常运行使用 10 秒预热即可
for i in {10..1}; do
    echo -ne "   ⏱️  正在准备中: $i 秒\r"
    sleep 1
done
echo -e "\n✅ 预热完毕。"
kill $GATEWAY_PRE_PID > /dev/null 2>&1

# 步骤 2: 启动 Dashboard
echo "🚀 启动控制面板获取 Token..."
openclaw dashboard --no-open &
DASH_PID=$!

echo "------------------------------------------------"
echo "👉 请寻找链接并复制。"
read -p "✅ 完成后按 [Enter] 回车以切换到网关模式..."

# 步骤 3: 关闭面板并进入实时网关
kill $DASH_PID > /dev/null 2>&1
echo "🆗 切换成功，进入网关实时监控模式..."
openclaw gateway --verbose
