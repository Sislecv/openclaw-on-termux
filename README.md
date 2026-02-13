# openclaw-on-termux
在termux上部署并运行openclaw
## 教程
1.安装**termux**

2.打开**termux**并运行
`curl -fSSL https://cdn.jsdelivr.net/gh/Sislecv/openclaw-on-termux@refs/heads/main/install.sh | bash`

3.结束后，**运行**（重要）
`termux-chroot`

4.运行`bash firstrun.sh`

5.复制命令行中输出的连接（带token）

6.在浏览器打开链接，成功啦🎉
下次运行时需要运行`termux-chroot``bash bot.sh`
