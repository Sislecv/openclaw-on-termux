#!/bin/bash

# 1. 启动 Dashboard 并放入后台
echo "正在启动 Dashboard (后台模式)..."

# 使用 nohup 确保关闭终端后进程不挂断，& 符号将其推入后台
# 日志会自动保存到当前目录的 dashboard.log 中
nohup openclaw dashboard --no-open > dashboard.log 2>&1 &

# 2. 等待面板初始化（给它 3 秒钟启动时间）
sleep 3

# 3. 提取并显示登录链接
echo "------------------------------------------------"
echo "✅ Dashboard 已在后台启动。"
echo "请从下方或 dashboard.log 中复制 Token 链接进行绑定："
echo "------------------------------------------------"

# 4. 启动 Gateway（在前台运行，方便观察实时 verbose 日志）
echo "正在启动 Gateway..."
openclaw gateway --verbose

