
{ config, pkgs, ... }: {

  home.username = "will";
  home.homeDirectory = "/home/will";

  home.packages = with pkgs; [
    ##############
    # Networking
    ##############
    nmap

    #############
    # System Utitlities
    #############
    btop
    
    ##################
    # Other
    ##################
    gh
    bitwarden-desktop
    obsidian
  ];

  # Git
  programs.git = {
    enable = true;
    userName = "Will Darragh";
    userEmail = "wdarragh16@gmail.com";
  };

  # Floorp
  programs.floorp = {
    enable = true;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}

