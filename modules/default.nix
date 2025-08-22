{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./audio.nix
    ./batteryProfile.nix
    ./desktop.nix
    ./development.nix
    ./font.nix
    #    ./optimisations.nix
    ./services.nix
    ./system.nix
  ];
}
