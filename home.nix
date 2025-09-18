{ pkgs, ... }:

{
  home.stateVersion = "25.05";
  
  home.packages = with pkgs; [
    git
    
    # shell
    nushell
    zoxide
    starship

    # editor
    helix

    # utils
    gitui
  ];

  programs.git = {
    enable = true;
    userName = "someh2705";
    userEmail = "someh2705@gmail.com";
  };

  programs.nushell = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
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
