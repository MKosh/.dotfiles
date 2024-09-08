{ pkgs ? import <nixpkgs> {} }:

  pkgs.mkShell {
      # Old devshell def. Keeping here for now
      # devShells.${system}.default = pkgs.mkShell.override {
      #     stdenv = pkgs.clangStdenv;
      #   } 
    packages = with pkgs; [
      # C/C++ dev
      # clang-tools needs to be listed above clang for clangd to work properly
      clang-tools
      clang
      lldb

      # GCC
      gcc
      gdb

      # General
      cmake
      gnumake
      ninja
      nlohmann_json
      pkg-config
      bear
      ncurses # For heasoft
      lynx # For heasoft
      zlib # For heasoft
      # gnulib
      libxcrypt
      curlFull

      # Rust
      rustc
      cargo
    
      # Fortran
      gfortran

      # Python
      python3
      python311Packages.astropy
      python311Packages.numpy
      python311Packages.scipy
      python311Packages.matplotlib
      python311Packages.pip


      # Graphics
      mesa
      glxinfo
      glfw
      wayland
      # glfw-wayland-minecraft
      glm
      glslang
      shaderc
      glsl_analyzer
      vulkan-headers
      vulkan-loader
      vulkan-validation-layers
    ];

    shellHook = ''
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.wayland}/lib"
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib"
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.glfw}/lib"
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.zlib}/lib"
    LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.curlFull.out}/lib"
    export LD_LIBRARY_PATH
    export GLFW="${pkgs.glfw}"
    '';

  }
