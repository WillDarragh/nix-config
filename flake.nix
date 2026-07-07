{
  description = "There is no escape--We pay for the violence of our ancestors.";

  inputs = {

    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Home Mangaer
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # 'follow' is for fancy inheritance
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS Cosmic
    nixpkgs.follows = "nixos-cosmic/nixpkgs";
    #nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      nixos-cosmic,
      ...
    }@inputs:
    {

      # Arrakis (Small Form Factor Desktop)
      nixosConfigurations.arrakis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya

          # System configuration
          ./hosts/arrakis/configuration.nix

          # Modules
          ./modules/gaming

          # Make home-manager module of nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Home-manager
            home-manager.users.will = import ./hosts/arrakis/users/will;
          }

          # Cosmic Desktop Environment
          {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
          nixos-cosmic.nixosModules.default
        ];
      };

      # Caladan (System76 LemurPro Laptop)
      nixosConfigurations.caladan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya
        
          # System configuration
          ./hosts/caladan/configuration.nix

          # Modules
          ./modules/gaming
           
          # Make home-manager module of nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Home-manager
            home-manager.users.will = import ./hosts/caladan/users/will;
          }
        ];
      };

      # Giedi-Prime (Intel NUC HTPC)
      nixosConfigurations.giedi-prime = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya
          
          # System configuration
          ./hosts/giedi-prime/configuration.nix
 
          # Modules
          ./modules/gaming

          # Make home-manager module of nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Home-manager
            home-manager.users.will = import ./hosts/giedi-prime/users/will;
            home-manager.users.tv = import ./hosts/giedi-prime/users/tv;
          }
        ];
      };
    };
}
