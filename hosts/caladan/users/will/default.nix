{ config, pkgs, ... }:
{

  home.username = "will";
  home.homeDirectory = "/home/will";

  imports = [

    ../../../../modules/users/will/programming
    ../../../../modules/users/will/desktop
    ../../../../modules/users/will/gnome
    ../../../../modules/gaming

  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}
