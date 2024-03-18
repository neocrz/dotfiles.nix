{ config, pkgs, inputs, pkgs-unstable, myconfig, system, ... }:
let 

  username = myconfig.user.name; 
  
  comMod = import ../../common/home;

in
{

  imports = (with comMod; [
    bash
    git
    kitty
    packages
    tmux

  ]) ++ [ ];

  home.packages = 
  (with pkgs; [
    
    firefox
    qbittorrent
    vscode

  ]) ++ (with pkgs-unstable; [

    discord
    obsidian
    telegram-desktop
    
  ]) ++ [ ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/${username}";

}
