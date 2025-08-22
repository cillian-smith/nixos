# home/default.nix
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Basic user settings
  home.username = "smithc";
  home.homeDirectory = "/home/smithc";
  home.stateVersion = "24.11";

  # Enable Home Manager for this user
  programs.home-manager.enable = true;

  systemd.user.services.home-manager-smithc = {
    serviceConfig = {
      Type = "oneshot";
    };
  };

  # Import all your module configurations
  imports = [
    ./programs
    ./wm
  ];
}
