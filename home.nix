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
