{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";

    vicinae.url = "github:vicinaehq/vicinae";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, alacritty-theme, vicinae, caelestia-shell, ... }:
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        stylix.nixosModules.stylix
        ./configuration.nix
      ];
    };

    homeConfigurations.mishanya = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ({ config, pkgs, ... }: {
          nixpkgs.overlays = [ alacritty-theme.overlays.default ];
        })
        vicinae.homeManagerModules.default
        caelestia-shell.homeManagerModules.default
        ./home-manager/home.nix
      ];
    };
  };
}
