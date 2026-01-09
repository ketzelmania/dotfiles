{ pkgs, ... }:

{
    home.packages = with pkgs; [
        swayfx
        swaylock-effects
        greetd
        brightnessctl
        waybar

        rofi
        rofi-blezz
        emojipick

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
        ungoogled-chromium
        rofi-blezz
        libreoffice
        xfce.thunar
        vlc
        obsidian
        yt-dlp

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
        zulu24
        openjfx
        maven

        clang-tools
        black
        pyright
        checkstyle
        google-java-format
        eslint_d
        prettierd
        luau-lsp
        lua-language-server
        stylua
        texlab
        typescript-language-server
        vale
        zls
        csslint
        gopls
        jdt-language-server

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

        pinta
        qbittorrent
    ];
}
