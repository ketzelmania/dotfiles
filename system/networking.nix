{ config, pkgs, lib, ... }:

{
    networking.hostName = "nixos";
    # networking.wireless.enable = true;

    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networking.networkmanager.enable = true;

    networking.firewall.allowedTCPPorts = [ 22 ];
    networking.firewall.allowedUDPPorts = [];

    services.openssh.enable = true;
    services.mullvad-vpn.enable = true;
    services.mullvad-vpn.package = pkgs.mullvad-vpn;
}
