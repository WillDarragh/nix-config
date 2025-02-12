
{ config, pkgs, ... }: {

  home.packages = with pkgs; [

    # Bitwarden
    bitwarden-desktop

    # Obsdiain
    obsidian

    # Discord client
    legcord

    # Spotify
    spotify
 ];

  # Floorp
  programs.floorp = {
    enable = true;
  };

  # Spotify-plyaer
  /*
  programs.spotify-player = {
    enable = true;
  };
  */
} 
