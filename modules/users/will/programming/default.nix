
{ config, pkgs, ... }: {

  home.packages = with pkgs; [
  
    # Nix Formatter
    nixfmt-rfc-style

    # Nix Language Server
    nil

  ];

  # Git
  programs.git = {
    enable = true;
    userName = "Will Darragh";
    userEmail = "wdarragh16@gmail.com";
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
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jnoortheen.nix-ide      
    ];
    userSettings = {
      "git.autoFetch" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "formatting" = {
          "command" = ["nixfmt"];
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

}

