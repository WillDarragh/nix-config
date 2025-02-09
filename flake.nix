
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
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    # Arrakis (Small Form Factor Desktop)
    nixosConfigurations.arrakis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [

        # System configuration
        ./hosts/arrakis/configuration.nix

        # Make home-manager module of nixos
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          # Home-manager
          home-manager.users.will = import ./hosts/arrakis/users/will.nix;
        }
      ];
    };

    # Caladan (System76 LemurPro Laptop)
    nixosConfigurations.caladan = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [

        # System configuration
        ./hosts/caladan/configuration.nix

        # Make home-manager module of nixos
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          # Home-manager
          home-manager.users.will = import ./hosts/caladan/users/will;
        }
      ];
    };
  };
}

