# OpenClaw on Termux 部署指南

### 1. 环境准备
安装 [Termux](https://f-droid.org/zh_Hans/packages/com.termux/) (推荐从 F-Droid 下载以获取最新版本)。

### 2. 一键安装
打开 Termux，复制并运行以下命令：
```bash
curl -fSSL https://cdn.jsdelivr.net/gh/Sislecv/openclaw-on-termux@refs/heads/main/install.sh | bash
```
3. 初始化环境
安装完成后，必须进入 chroot 环境（必做步骤）：
```bash
termux-chroot
```

5. 首次运行配置
执行引导脚本进行初始化：
```bash
bash firstrun.sh
```

 * Token 绑定：在终端输出中找到并复制带有 token 的链接。
 * 完成授权：在浏览器中访问该链接完成绑定。
5. 日常运行
下次启动 Termux 后，请依次执行以下命令：
```bash
termux-chroot
bash bot.sh
```

