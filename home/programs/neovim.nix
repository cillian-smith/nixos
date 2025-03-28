{ config, lib, pkgs, nixvim, ... }:

{
  # Use your custom Neovim from the flake
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    
    # Reference the package directly from your flake output
    package = nixvim.packages.${pkgs.system}.default;
  };
  
  # If you want to add the 'nvim' command to your PATH
  home.packages = [
    nixvim.packages.${pkgs.system}.default
  ];
}
