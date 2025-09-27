{ config, pkgs, ... }:
{

  home.username = "will";
  home.homeDirectory = "/home/will";

  imports = [

    ../../../../home/will/programming
    ../../../../home/will/desktop/tv
    ../../../../home/will/gnome

  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}
