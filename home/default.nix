# home/default.nix
{ config, lib, pkgs, ... }:

{
  # Basic user settings
  home.username = "smithc";
  home.homeDirectory = "/home/smithc";
  home.stateVersion = "24.11";
  
  # Enable Home Manager for this user
  programs.home-manager.enable = true;
  
  # Import all your module configurations
  imports = [
    ./programs
    ./wm
  ];
}
