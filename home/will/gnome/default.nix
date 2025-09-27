{ config, pkgs, ... }:
{

  home.packages = with pkgs; [

    gnomeExtensions.caffeine
    gnomeExtensions.pop-shell

  ];

}
