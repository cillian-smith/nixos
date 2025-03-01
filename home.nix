{ config, pkgs, ... }:
{
  home.username = "smithc";
  home.homeDirectory = "/home/smithc";
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;

  # Only include packages not already in system configuration
  home.packages = with pkgs; [
    # Add user-specific packages here that aren't already in configuration.nix
    zsh
    starship
  ];

  # Personal configurations
  programs.git = {
    enable = true;
    userName = "Cillian Smith";
    userEmail = "cilliansmith.1010@gmail.com";
  };

  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "Mononoki Nerd Font";
      size = 12;
    };
    settings = {
      background_opacity = "0.95";
      confirm_os_window_close = 0;
    };
  };

  # Hyprland user configuration (not enabling - that's done in system config)
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
       # Monitor configuration
      # monitor = "eDP-1,preferred,auto,1";
      monitor = "eDP-1,1920x1080,auto,1";

# Disable automatic scaling
    env = [
      "XCURSOR_SIZE,24"
      "GDK_SCALE,1"
      "HYPRLAND_NO_AUTOSCALE,1"  # This is the key line
    ];
      
      # Define variables for programs
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun -show-icons";
      "$mod" = "SUPER";  # Sets "Windows" key as main modifier
      
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, dolphin"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
	"$mod,1,workspace,1"
        "$mod,2,workspace,2"
        "$mod,3,workspace,3"
        "$mod,4,workspace,4"
        "$mod,5,workspace,5"
        "$mod,6,workspace,6"
        "$mod,7,workspace,7"
        "$mod,8,workspace,8"
        "$mod,9,workspace,9"
        "$mod,0,workspace,10"

      ];
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "sudo" ];
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "network" "battery"];
      };
    };
  };
}
