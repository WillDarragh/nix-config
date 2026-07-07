{ config, pkgs, ... }:
{

  home.packages = with pkgs; [

    # Nix Formatter
    nixfmt

    # Nix Language Server
    nil

  ];

  # Git
  programs.git = {
    enable = true;
    settings = {
    user.name = "Will Darragh";
    user.email = "wdarragh16@gmail.com";
    };
  };

  # Vim
  programs.vim = {
    enable = true;
  };

  # GitHub
  programs.gh = {
    enable = true;
  };

  # VSCodium
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jnoortheen.nix-ide
      christian-kohler.path-intellisense
    ];
    userSettings = {
      "git.autoFetch" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
          "diagnostics" = {
            "ignored" = [
              "unused_binding"
              "unused_with"
            ];
          };
        };
      };
    };
    };
  };

}
