{config, pkgs, myconfig, ...}:
let
  username = myconfig.user.name;
in
{

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.waydroid.enable = true;

  users.users.${username}.extraGroups = [ "libvirtd" ];

}
