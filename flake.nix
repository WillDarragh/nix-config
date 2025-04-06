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

    # NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      ...
    }@inputs:
    {

      # Arrakis (Small Form Factor Desktop)
      nixosConfigurations.arrakis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          # System configuration
          ./hosts/arrakis/configuration.nix

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya

          # Make home-manager module of nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Home-manager
            home-manager.users.will = import ./hosts/arrakis/users/will;

            # Steam
            programs.steam.enable = true;
          }
        ];
      };

      # Caladan (System76 LemurPro Laptop)
      nixosConfigurations.caladan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          # System configuration
          ./hosts/caladan/configuration.nix

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya
        
          # Make home-manager module of nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Home-manager
            home-manager.users.will = import ./hosts/caladan/users/will;

            # Steam
            programs.steam.enable = true;
          }
        ];
      };

      # Giedi-Prime (Intel NUC HTPC)
      nixosConfigurations.giedi-prime = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          # System configuration
          ./hosts/giedi-prime/configuration.nix

          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya
        
          # Make home-manager module of nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Home-manager
            home-manager.users.will = import ./hosts/giedi-prime/users/will;
            home-manager.users.tv = import ./hosts/giedi-prime/userss/tv;

            # Steam
            programs.steam.enable = true;
          }
        ];
      };
    };
}
