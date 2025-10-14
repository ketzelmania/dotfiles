{ config, pkgs, lib, ... }:

{
    imports = [
        ./bootloader.nix
        ./networking.nix
        ./security.nix

        ./users.nix
        ./keyboard.nix
        ./audio.nix
        ./bluetooth.nix
        ./xdg.nix
        ./locale.nix
        ./fonts.nix

        ./tailscale.nix

        ./systemPackages.nix
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];

    system.stateVersion = "25.11";
}
