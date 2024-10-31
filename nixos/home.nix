{ config, pkgs, pkgs-unstable, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "markm";
  home.homeDirectory = "/home/markm";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./modules/sh.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = 
    (with pkgs; [
      # (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      xclip
      wl-clipboard
      gnuplot
      nix-prefetch
      kdePackages.kcachegrind
      valgrind
    ])
    ++
    (with pkgs-unstable; [
      neovim
    ]);
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/markm/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  home.sessionPath = [
    "$HOME/utils/"
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # Shell
  #programs.zsh.enable = true;
#  programs.zsh.initExtra = "source ~/.p10k.zsh";
#  programs.zsh.initExtra = "source ~/.functions.zsh";
#  programs.zsh = {
#    enable = true;
#    enableCompletion = true;
#    autosuggestion.enable = true;
#    syntaxHighlighting.enable = true;
#
#    plugins = [
#      {
#        name = "powerlevel10k";
#        src = pkgs.zsh-powerlevel10k;
#        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
#      }
#      {
#        name = "powerlevel10k-config";
#        src = ./p10k-config;
#        file = ".p10k.zsh";
#      }
#    ];
#
#    oh-my-zsh = {
#      enable = true;
#      plugins = [ "git" ];
#    };
#
#  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
