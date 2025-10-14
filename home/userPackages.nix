{ pkgs, ... }:

{
    home.packages = with pkgs; [
        swayfx
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

        lsd
        bat
        fzf
        ripgrep
        wl-clipboard
        fastfetch
        gh
        tree

        rustup

        grim
        slurp

        btop
        duf
        pavucontrol

        zsh-powerlevel10k
        zsh-autosuggestions
        zsh-history-substring-search
        zsh-syntax-highlighting
    ];
}
