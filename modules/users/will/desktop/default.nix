
{ config, pkgs, ... }: {

  home.packages = with pkgs; [

    # Bitwarden
    bitwarden-desktop

    # Obsdiain
    obsidian

 ];

  # Floorp
  programs.floorp = {
    enable = true;
  };

} 
