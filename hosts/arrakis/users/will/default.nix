{ config, pkgs, ... }:
{

  home.username = "will";
  home.homeDirectory = "/home/will";

  imports = [

    ../../../../home/users/will/programming
    ../../../../home/users/will/desktop/4k
    ../../../../home/users/will/gnome
    ../../../../home/users/will/art

  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

}
