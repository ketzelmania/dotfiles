{ pkgs, lib, ... }:

{
  imports = [
    ./sway.nix
    ./neovim.nix
    ./development.nix
    ./zsh.nix
    ./tmux.nix
    ./vesktop.nix
  ];

  home.stateVersion = "25.11";

  home.file.".xkb/symbols".source = ../dotfiles/xkb;
  home.file.".config/xdg-desktop-portal/sway-portals.conf".source = ../dotfiles/xdg/sway-portals.conf;

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: size: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = size;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }}/cursors/Breeze/Breeze $out/share/icons/'${name}'
              export XCURSOR_SIZE=${toString size}
          '';
        };
    in
      getFrom 
        "https://invent.kde.org/plasma/breeze/-/archive/54ffea94f71a06451e1eefd8bb741973a204a509/breeze-54ffea94f71a06451e1eefd8bb741973a204a509.tar.gz"
        "sha256-7Pr900WnHccl0Jh0cMM0Ek5qNzzq1PfjlBBEBMbh5ys="
        "Breeze"
        20;

  gtk = {
      enable = true;
      cursorTheme = {
          name = "Breeze";
      };
  };

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
