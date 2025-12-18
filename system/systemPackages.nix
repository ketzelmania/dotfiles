{ config, pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
        vim
        wget
        dbus
        pulseaudio
        flatpak
    ];

    services.flatpak.enable = true;
}
