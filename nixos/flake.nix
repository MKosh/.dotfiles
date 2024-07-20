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
	    nixosConfigurations = {
	      nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
	      };
      };
      homeConfigurations = {
        markm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
      devShells.${system}.default = pkgs.mkShell.override {
          stdenv = pkgs.clangStdenv;
        } 
        {
          nativeBuildInputs = with pkgs; [
            clang
            cmake
            gnumake
            libclang
          ];

          packages = with pkgs; [
            clang-tools
            rustc
            cargo
            python3
            lldb
            glxinfo
            mesa
            glsl_analyzer
            imgui
            glfw
            glfw-wayland-minecraft
            pkg-config
            nlohmann_json
          ];

          shellHook = ''
            LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.libclang}/resource-root/lib/linux"
            LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.wayland}/lib"
            LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib"
            export LD_LIBRARY_PATH
            export IMGUI="${pkgs.imgui}"
          '';
        };
    };

}
