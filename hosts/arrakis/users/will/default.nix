{ config, pkgs, ... }:
{

  home.username = "will";
  home.homeDirectory = "/home/will";

  imports = [

    ../../../../home/will/programming
    ../../../../home/will/desktop/4k
    ../../../../home/will/gnome
    ../../../../home/will/art

  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}
