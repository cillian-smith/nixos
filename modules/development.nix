{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Development tools
    git
    inputs.neovim-config.packages.${pkgs.system}.default   
     #neovim
    vscode
    docker-compose

    # Programming languages
    python3

    # Build tools
    gcc
    gnumake
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  users.users.smithc.extraGroups = [ "docker" ];

}
