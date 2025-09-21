{ pkgs, ... }:

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

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      theme = "catppuccin-latte";
      default_layout = "compact";
    };
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };
  
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "onelight";
      editor.true-color = true;
    };
  };

  programs.gitui = {
    enable = true;
  };
}
