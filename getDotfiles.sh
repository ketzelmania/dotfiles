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
"~/Pictures/wp11541583-call-of-cthulhu-wallpapers.jpg" "wallpaper"
)

mv "$HOME/dotfiles/getDotfiles.sh" "$HOME/dotfiles/.getDotfiles.sh"

rm -rfd dotfiles/*

mv "$HOME/dotfiles/.getDotfiles.sh" "$HOME/dotfiles/getDotfiles.sh"

if [ ! -d "dotfiles" ]; then
    mkdir "$HOME/dotfiles"
fi

for i in ${!paths[@]}; do
    if (((i % 2)==1)); then
        continue
    fi

    rawPath=${paths[i]}
    path="${rawPath/#~/$HOME}"
    destination=${paths[i + 1]}

    if [ ! -d $destination ]; then
        mkdir -p "$HOME/dotfiles/$destination"
    fi

    cp -r $path "$HOME/dotfiles/$destination"
done

# cleanup

rm -rfd dotfiles/nvim/.git
