{
  config,
  lib,
  pkgs,
  nixvim,
  ...
}: {
  # If you want to add the 'nvim' command to your PATH
  home.packages = [
    nixvim.packages.${pkgs.system}.default
  ];

  # Use your custom Neovim from the flake
  #programs.neovim = {
  #  enable = true;
  #  defaultEditor = true;
  #
  #  # Reference the package directly from your flake output
  #  package = nixvim.packages.${pkgs.system}.default;
  #};
}
