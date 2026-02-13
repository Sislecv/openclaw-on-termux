termux-change-repo
termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install proot -y
echo "proot installed"
pkg install nodejs-lts python make build-essential git -y
npm install -g openclaw@latest
curl -fssl https://raw.githubusercontent.com/Sislecv/openclaw-on-termux/refs/heads/main/firstrun.sh
echo "openclaw installed.now run termux-chroot and bash firstrun.sh"
