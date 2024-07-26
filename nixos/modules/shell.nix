{ pkgs ? import <nixpkgs> {} }:

  pkgs.mkShell {
      # Old devshell def. Keeping here for now
      # devShells.${system}.default = pkgs.mkShell.override {
      #     stdenv = pkgs.clangStdenv;
      #   } 
    packages = with pkgs; [
      # C/C++ dev
      # Clang
      clang
      clang-tools
      lldb

      # GCC
      gcc
      gdb

      # General
      gnumake
      ninja
      nlohmann_json
      pkg-config

      # Rust
      rustc
      cargo

      # Python
      python3

      # Graphics
      mesa
      glxinfo
      glfw
      # glfw-wayland-minecraft
      glm
      glslang
      shaderc
      glsl_analyzer
      imgui
      vulkan-headers
      vulkan-loader
      vulkan-validation-layers
    ];

    # shellHook = ''
    #   #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.libclang}/resource-root/lib/linux"
    #   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.wayland}/lib"
    #   #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib"
    #   #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.vulkan-loader}/lib"
    #   #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.glfw-wayland-minecraft}/lib"
    #   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.glfw}/lib"
    #   export LD_LIBRARY_PATH
    #   export IMGUI="${pkgs.imgui}"
    # '';

  }
