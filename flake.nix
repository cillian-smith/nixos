{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        nixos-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # Import the hardware configuration first
            ./hardware-configuration.nix
            
            # Core configuration
            ./configuration.nix
            
            # Home-manager module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.smithc = import ./home/default.nix;
              home-manager.backupFileExtension = "backup";
            }

            # Hyprland module
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
          ];
        };
      };
    };
}
