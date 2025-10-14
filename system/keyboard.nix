{ config, pkgs, lib, ... }:

{
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
}
