{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    system = ["x86_64-linux"];
    hostname = "nixos";
    stateVersion = "25.11";
    username = "met";
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./system
        ./hardware.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = ./home;
        }
      ];
    };
  };
}

