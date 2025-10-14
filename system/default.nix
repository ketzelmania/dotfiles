{ config, pkgs, lib, ... }:

{
    imports = [
        ./bootloader.nix
        ./networking.nix
        ./locale.nix
        ./fonts.nix
        ./keyboard.nix
        ./users.nix
        ./security.nix
        ./systemPackages.nix
        ./xdg.nix
        ./bluetooth.nix
        ./audio.nix
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];

    system.stateVersion = "25.11";
}
