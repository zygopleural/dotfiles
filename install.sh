#!/bin/sh

echo "==========================================================="
echo "             installing fonts                              "
echo "-----------------------------------------------------------"
mkdir -pv "/usr/local/share/fonts/MesloLGS NF"
cp -v ./fonts/* "/usr/local/share/fonts/MesloLGS NF/"

echo "==========================================================="
echo "             cloning zsh-autosuggestions                   "
echo "-----------------------------------------------------------"
git clone --depth=1 \
    https://github.com/zsh-users/zsh-autosuggestions \
    "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

echo "==========================================================="
echo "             cloning zsh-syntax-highlighting               "
echo "-----------------------------------------------------------"
git clone --depth=1 \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

echo "==========================================================="
echo "             cloning powerlevel10k                         "
echo "-----------------------------------------------------------"
git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"

echo "==========================================================="
echo "             import zshrc                                  "
echo "-----------------------------------------------------------"
mv "${HOME}/.zshrc" "${HOME}/.zshrc.original"
cat .zshrc > "${HOME}/.zshrc"

echo "==========================================================="
echo "             import powerlevel10k                          "
echo "-----------------------------------------------------------"
cat .p10k.zsh > "${HOME}/.p10k.zsh"
