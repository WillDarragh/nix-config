
{ config, pkgs, ... }: {

  home.packages = with pkgs; [

    # Github
    gh

  ];

  # Git
  programs.git = {
    enable = true;
    userName = "Will Darragh";
    userEmail = "wdarragh16@gmail.com";
  };

}

