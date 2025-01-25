
{ config, pkgs, ... }: {

  home.packages = with pkgs; [
  
    # Nix Formatter
    nixfmt-rfc-style

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
  };

}

