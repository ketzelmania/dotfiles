{ config, pkgs, lib, ... }:

{
    programs.zsh.enable = true;

    users.users.met = {
        isNormalUser = true;
        description = "met";
        extraGroups = [ "networkmanager" "wheel" "input" ];
        packages = with pkgs; [];

        shell = pkgs.zsh;
    };
}
