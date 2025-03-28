{ config, lib, pkgs, ... }:

{
   
  # Shell
  programs.zsh.initExtra = ''
    source ~/.p10k.zsh
    source ~/.functions.zsh
    source ~/.fzf-git.sh
    export DIRENV_LOG_FORMAT=
    export CC=clang
    export CXX=clang++
    export FC=gfortran
    export PERL=perl
    export PYTHON=python3
    export RIPGREP_CONFIG_PATH=~/.ripgreprc
  '';

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "direnv" ];
    };

    # sessionVariables = {
      # CC=clang;
      # "CXX=clang++";
      # FC=gfortran;
      # PERL=perl;
      # PYTHON=python3;
    # };

  };
}
