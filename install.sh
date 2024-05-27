#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

#Actualizando Sistema
sudo pacman -Syy
sudo pacman -Syu

#Instalando dependencias basicas
sudo pacman -S curl wget neofetch yay

#Instalando bat
yay -S bat

# Instalando p10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k


# Instando lsd

sudo pacman -S kitty zsh lsd

# Instalamos las HackNerdFonts

sudo mkdir /usr/local/share/fonts/

sudo cp -v $ruta/fonts/HNF/* /usr/local/share/fonts/


# Copiando Archivos de Configuración

cp -rv $ruta/Config/kitty/ ~/.config/
sudo cp -rv $ruta/kitty /opt/

# Copia de configuracion de .p10k.zsh y .zshrc

rm -rf ~/.zshrc
cp -v $ruta/.zshrc ~/.zshrc

cp -v $ruta/.p10k.zsh ~/.p10k.zsh
sudo cp -v $ruta/.p10k.zsh-root /root/.p10k.zsh

# Plugins ZSH

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

mv -v zsh-syntax-highlighting/ ~/

sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

echo "Terminado, eliminando repositorio"

sudo rm -r $ruta

notify-send "KITTY CUSTOM INSTALADO"
