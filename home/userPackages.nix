{ pkgs, ... }:

{
    home.packages = with pkgs; [
        swayfx
        swaylock-effects
        greetd
        wofi
        brightnessctl
        waybar

        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-utils
        glib
        dconf
        gsettings-desktop-schemas
        libnotify

        kitty
        librewolf
        kdePackages.okular
        beeper
        mullvad-vpn
        ungoogled-chromium
        rofi-blezz
        libreoffice
        xfce.thunar
        vlc
        obsidian

        lsd
        bat
        fzf
        ripgrep
        wl-clipboard
        fastfetch
        gh
        tree
        wine
        unzip

        rustup
        python3
        go
        gcc

        grim
        slurp
        zenity
        imagemagick
        imv

        btop
        duf
        pavucontrol

        zsh-powerlevel10k
        zsh-autosuggestions
        zsh-history-substring-search
        zsh-syntax-highlighting

        flatpak
        nodejs
    ];
}
