{
  description = "NixOS configuration - phmoraesdev";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }:
  let
    mkHost = hostname: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit hostname; };
      modules = [
        ./configuration.nix
        ./hosts/${hostname}/hardware-configuration.nix
        ./hosts/${hostname}/host.nix

        nix-flatpak.nixosModules.nix-flatpak

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs       = true;
          home-manager.useUserPackages     = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs    = { inherit hostname; };
          home-manager.users.pepe          = import ./home.nix;
        }
      ];
    };
  in {
    nixosConfigurations.desktop  = mkHost "desktop";
    nixosConfigurations.thinkpad = mkHost "thinkpad";
  };
}
