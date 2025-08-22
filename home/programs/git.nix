{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userName = "smithc";
    userEmail = "cilliansmith.1010@gmail.com";
    extraConfig = {
      core.editor = "nvim";
    };
  };
}
