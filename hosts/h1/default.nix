{pkgs, pkgs-unstable, inputs, myconfig, system, ...}:

let 
  username = myconfig.user.name; 
  lib = pkgs.lib;
in
{
 
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./configuration.nix
  ];
  home-manager = {
    extraSpecialArgs = {inherit inputs pkgs pkgs-unstable myconfig system;};
    useGlobalPkgs = false;
    useUserPackages = true;
    users.${username} = import ./home.nix;
  };
  
}