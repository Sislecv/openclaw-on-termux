termux-change-repo
termux-setup-storage
pkg update && pkg upgrade
pkg install proot
pkg install nodejs-lts python make build-essential git -y
npm install -g openclaw@latest
echo "openclaw installed.now run termux-chroot"
