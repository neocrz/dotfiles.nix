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
    davinci-resolve 
    firefox
    glmark2
    qbittorrent
    scrcpy
    telegram-desktop
    vscode

  ]) ++ (with pkgs-unstable; [

    discord
    krita
    libreoffice-qt
    nvtopPackages.full
    obsidian
    vlc
    
  ]) ++ [ ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.sessionVariables.NIX_PATH = "nixpkgs=${pkgs.path}:unstable=${pkgs-unstable.path}";

}
