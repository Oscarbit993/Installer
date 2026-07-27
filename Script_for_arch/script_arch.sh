#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo "No corras este script con sudo, ejecútalo como tu usuario normal."
    exit 1
fi

echo "Bienvenido al script de instalacion para Archlinux, este script iniciara servicios, añadira repositorios, instalara herramientas, etcetera..."
sleep 1
#echo "Ingresa tu contraseña (No se te pedira mas adelante) para iniciar la instalacion al instante"
#sudo -v
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
#KEEPALIVE_PID=$!

main_all(){
sudo pacman -Syu --noconfirm
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
rm -rf strap.sh
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git neovim fzf bat base-devel firefox hyprland nerd-fonts zsh wget torbrowser-launcher flatpak kitty unzip starship btop htop openvpn yazi bluez bluez-utils networkmanager rofi nautilus mako hyprshot fastfetch pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber playerctl spotify-launcher awww blueman nmap burpsuite openssh wireshark-qt whatweb tmux python
mkdir -p ~/Wallpapers ~/Descargas ~/Proyectos ~/Escuela ~/Proyectos/Python ~/Proyectos/Bash ~/.config/hypr
curl -L -o $HOME/Wallpapers/Wall-1.png https://w.wallhaven.cc/full/k8/wallhaven-k82p6d.png
curl -L -o $HOME/Wallpapers/Wall-2.png https://w.wallhaven.cc/full/w5/wallhaven-w5m62x.png
curl -L -o $HOME/Wallpapers/Wall-3.png https://w.wallhaven.cc/full/xe/wallhaven-xepp7d.jpg
curl -L -o $HOME/Wallpapers/Wall-4.png https://w.wallhaven.cc/full/ml/wallhaven-ml2191.jpg
curl -L -o $HOME/Wallpapers/Wall-5.png https://w.wallhaven.cc/full/5g/wallhaven-5g96j3.jpg
curl -L -o $HOME/Wallpapers/Wall-6.png https://w.wallhaven.cc/full/3q/wallhaven-3q5k8y.png
curl -L -o $HOME/Wallpapers/Wall-7.png https://w.wallhaven.cc/full/zp/wallhaven-zpo7dy.png
curl -L -o $HOME/Wallpapers/Wall-8.png https://w.wallhaven.cc/full/9d/wallhaven-9djdkw.png
curl -L -o $HOME/Wallpapers/Wall-9.png https://w.wallhaven.cc/full/kx/wallhaven-kx99jm.png
curl -L -o $HOME/Wallpapers/Wall-10.png https://w.wallhaven.cc/full/7j/wallhaven-7jjo5e.jpg
systemctl --user enable pipewire pipewire-pulse wireplumber
sudo systemctl enable --now bluetooth
flatpak install -y flathub org.vinegarhq.Sober
cp Dotfiles/hyprland.lua ~/.config/hypr
cp Dotfiles/.zshrc $HOME
sudo pacman -S --needed base-devel --noconfirm
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

main_all
chsh -s "$(which zsh)"
echo "A finalizado el script, "
