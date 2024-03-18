{ config, pkgs, inputs, pkgs-unstable, myconfig, system, ... }:
let 

  username = myconfig.user.name; 
  
  comMod = import ../../common/home;

in
{

  imports = [
    comMod.git
  ];

  home.packages = 
  (with pkgs; [
    
    firefox
    vscode

  ]) ++ (with pkgs-unstable; [

    discord
    obsidian
    telegram-desktop
    
  ]) ++ [ 

    inputs.nixvim.packages.${system}.default

  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/${username}";

}