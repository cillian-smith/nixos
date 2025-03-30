{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar.nix
    ./mako.nix
  ];
}
