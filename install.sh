termux-change-repo
termux-setup-storage
pkg update && pkg upgrade
pkg install proot
pkg install nodejs-lts python make build-essential git -y
npm install -g openclaw@latest
curl -fssl -o https://raw.githubusercontent.com/Sislecv/openclaw-on-termux/refs/heads/main/firstrun.sh
echo "openclaw installed.now run termux-chroot and bash firstrun.sh"
