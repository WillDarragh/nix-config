{ config, pkgs, ... }:
{

  imports = [
    ./../default.nix
  ];

  /*
  home.packages = with pkgs; [

  ];
  */

  programs.firefox = {
    profiles = {
      default = {
        settings = {
          "layout.css.devPixelsPerPx" = 2.5;
        };
      };
    };
  };

}