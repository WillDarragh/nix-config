{ config, pkgs, ... }:
{

  home.username = "will";
  home.homeDirectory = "/home/will";

  imports = [

    ../../../../home/will/programming
    ../../../../home/will/desktop
    ../../../../home/will/gnome

  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  #home.stateVersion = "unstable";

  programs.home-manager.enable = true;

}
