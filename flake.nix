{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-config.url = "github:cillian-smith/nix-neovim";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, nixvim, neovim-config, ... }@inputs:  # Add @inputs here
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
          specialArgs = { inherit inputs; };  # Now inputs is defined
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
              home-manager.users.smithc = import ./home;
              home-manager.backupFileExtension = "backup";
              # Pass inputs to home-manager as well
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
            # Hyprland module
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
          ];
        };
      };
    };
}
