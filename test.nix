
{ config, pkgs, ... }:

{

  environment.systemPackages = [
    pkgs.floorp
  ];

}

