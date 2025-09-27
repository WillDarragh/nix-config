{ config, pkgs, ... }:
{

  home.username = "tv";
  home.homeDirectory = "/home/tv";

  imports = [


  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.firefox = {
    profiles = {
      default = {
        settings = {
          "layout.css.devPixelsPerPx" = 4.0;
        };
      };
    };
  };

}