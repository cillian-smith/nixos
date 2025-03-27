{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.neovim-config.packages.${pkgs.system}.default
  ];
}
