
{ 
  description = "There is no escape--We pay for the violence of our ancestors.";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.arrakis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import configuration.nx
        ./configuration.nix
      ];
    };
  };
}

