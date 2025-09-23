{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-wsl, home-manager, ... }:
    let
      system = "x86_64-linux";

      system-module = { pkgs, ... }: {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        environment.systemPackages = with pkgs; [
          git

          # lsp
          nil
          nixd
        ];

        system.stateVersion = "25.05";
      };

      nixos-wsl-module = { ... }: {
        wsl = {
          enable = true;
          defaultUser = "nixos";
        };
      };
      
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit home-manager; };

          modules = [
            system-module
            
            nixos-wsl.nixosModules.wsl
            nixos-wsl-module

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true; 
                users.nixos = import ./home.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };
      };
    };
}
