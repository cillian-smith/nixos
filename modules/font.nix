{config, lib, pkgs, ...}: 
{
  fonts.packages = with pkgs; [
  font-awesome
  nerd-fonts.mononoki
  #mononoki
];
}
