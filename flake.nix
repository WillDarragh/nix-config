
{ 
  description = "There is no escape--We pay for the violence of our ancestors.";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Cosmic desktop
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.arrakis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          nix.settings = {
	    substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBenWjrkPv6rtxpmMdRe102smYzA85dPE=" ];
          };
        }
        nix-cosmic.nixosModules.default
        # Import configuration.nx
        ./configuration.nix
      ];
    };
  };
}

