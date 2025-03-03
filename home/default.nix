{config, lib, pkgs,...}: 
{
imports = [  
  ./home.nix
  ./programs
  ./wm
  ];
}
