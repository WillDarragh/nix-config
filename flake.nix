
{ 
  description = "There is no escape--We pay for the violence of our ancestors.";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # Home Mangaer
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # 'follow' is for fancy inheritance
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Cosmic desktop
    #nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = { self, nixpkgs, home-manager, /*nixos-cosmic,*/ ... }@inputs: {
    nixosConfigurations.arrakis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        /*{
          nix.settings = {
	    substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBenWjrkPv6rtxpmMdRe102smYzA85dPE=" ];
          };
        }
        nixos-cosmic.nixosModules.default
        */

        # Import configuration.nix
        ./configuration.nix

        # Host import
        ./test.nix

        # Make home-manager module of nixos
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # User
          home-manager.users.will = import ./home.nix;
        }
      ];
    };
    nixosConfigurations.test = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import configuration.nx
        ./configuration.nix
       
        # Host import
        ./hosts/test
 
        # Make home-manager module of nixos
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # User
          home-manager.users.will = import ./home.nix;
        }
      ];
    };
  };
}

