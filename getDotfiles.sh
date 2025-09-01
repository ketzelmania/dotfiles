paths=(
"~/.config/nvim" ""
"~/.config/fastfetch" ""
"~/.config/kitty" ""
"~/.config/lsd" ""
"~/.config/rofi" ""
"~/.config/sway" ""
"~/.config/vesktop/themes" "vesktop"
"~/.config/vesktop/settings" "vesktop"
"~/.config/waybar" ""
"~/.config/wofi" ""
"~/.config/xkb/symbols/us_qwerty-prog" "xkb"
"~/.zshrc" "zsh"
"~/.p10k.zsh" "p10k"
"~/.tmux.conf" "tmux"
)

if [ ! -d "dotfiles" ]; then
    mkdir "dotfiles"
fi

for i in ${!paths[@]}; do
    if (((i % 2)==1)); then
        continue
    fi

    rawPath=${paths[i]}
    path="${rawPath/#~/$HOME}"
    destination=${paths[i + 1]}

    if [ ! -d $destination ]; then
        mkdir -p "dotfiles/$destination"
    fi

    cp -r $path "dotfiles/$destination"
done

# cleanup

rm -rfd dotfiles/nvim/.git
