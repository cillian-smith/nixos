{config, lib, pkgs, ... }:
{

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
}
