
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

  # Firesfox
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        name = "default";
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          privacy-badger
        ];
      };
    };
  };

} 
