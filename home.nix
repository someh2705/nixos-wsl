{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-wsl/config";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "someh2705";
    userEmail = "someh2705@gmail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      # eza
      ls = "eza --color=always --group-directories-first --icons";
      ll = "eza -la --icons --octal-permissions --group-directories-first";
      lt = "eza -laT --icons --level=2 --color=always --group-directories-first";
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.atuin = {
    enable = true;
  };

  xdg.configFile."zellij" = {
    source = mkSymlink "${dotfiles}/zellij/";
    recursive = true;
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.ripgrep = {
    enable = true;    
  };

  xdg.configFile."helix" = {
    source = mkSymlink "${dotfiles}/helix/";
    recursive = true;
  };
  
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.gitui = {
    enable = true;
  };
}
