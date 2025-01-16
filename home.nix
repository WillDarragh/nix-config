
{ config, pkgs, ... }:

{
  home.username = "will";
  home.homeDirectory = "/home/will";

  home.packages = with pkgs; [
    nmap
    btop
  ];

  programs.git = {
    enable = true;
    userName = "Will Darragh";
    userEmail = "wdarragh16@gmail.com";
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}

