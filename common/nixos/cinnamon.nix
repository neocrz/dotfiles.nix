{config, pkgs, myconfig, ...}: 

{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
}
