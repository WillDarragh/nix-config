{ config, pkgs, ... }:
{

  home.packages = with pkgs; [

    # gimp
    gimp

  ];
# OBS
programs.obs-studio.enable = true;

}
