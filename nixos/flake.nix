{
  description = "First flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable"; #github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    wezterm-flake.url = "github:wez/wezterm/main?dir=nix";
    # wezterm-flake.inputs.nixpkgs.follows =  "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, wezterm-flake, ... }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations.lg-gram = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./systems/lg-gram/configuration.nix ];
      specialArgs = {
        inherit pkgs-unstable;
        inherit wezterm-flake;
      };
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./systems/desktop/configuration.nix ];
      specialArgs = {
        inherit pkgs-unstable;
      };
    };

    nixosConfigurations.sl3 = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./systems/sl3/configuration.nix ];
      specialArgs = {
        inherit pkgs-unstable;
      };
    };

    homeConfigurations = {
      markm = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
    devShells.${system}.default = (import ./modules/shell.nix { inherit pkgs; });
  };

}
