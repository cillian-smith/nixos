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
    userEmail = "your.email@example.com";
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
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, dolphin"
        "$mod, V, togglefloating"
        "$mod, R, exec, rofi -show drun"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
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
