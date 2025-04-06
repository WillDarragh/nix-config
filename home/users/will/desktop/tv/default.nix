{ config, pkgs, ... }:
{

  imports = [
    ./../default.nix
    ./../4k/default.nix
  ];

  /*
  home.packages = with pkgs; [

  ];
  */

  dconf = {
    enable = true;

    settings = {
      
    };
  };

}