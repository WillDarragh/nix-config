
{ config, pkgs, ... }: {

  home.username = "will";
  home.homeDirectory = "/home/will";

  home.packages = with pkgs; [
    ##############
    # Web Browsers
    ##############
    floorp

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
  ];

  programs.git = {
    enable = true;
    userName = "Will Darragh";
    userEmail = "wdarragh16@gmail.com";
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}

