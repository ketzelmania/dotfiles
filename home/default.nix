{ pkgs, lib, ... }:

{
    imports = [
        ./cursor.nix
        ./keyboard.nix
        ./xdg.nix
        ./userPackages.nix

        ./sway.nix
        ./neovim.nix
        ./git.nix
        ./gh.nix
        ./kitty.nix
        ./zsh.nix
        ./tmux.nix
        ./vesktop.nix
    ];

    home.stateVersion = "25.11";
}
