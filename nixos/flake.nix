{
  description = "First flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
	    nixosConfigurations.lg-gram = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./systems/lg-gram/configuration.nix ];
      };
	    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./systems/desktop/configuration.nix ];
      };
	    nixosConfigurations.sl3 = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./systems/sl3/configuration.nix ];
      };
      homeConfigurations = {
        markm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
      devShells.${system}.default = (import ./modules/shell.nix { inherit pkgs; });
    };

}
