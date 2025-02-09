
{ config, pkgs, ... }: {

  home.packages = with pkgs; [

    # Bitwarden
    bitwarden-desktop

    # Obsdiain
    obsidian

    # Discord client
    legcord

 ];

  # Floorp
  programs.floorp = {
    enable = true;
  };

  # Spotify
  programs.spotify-player = {
    enable = true;
  };

} 
