{config, pkgs, myconfig, ...}: 

let
  username = myconfig.user.name;
in
{
  programs.adb.enable = true;
  users.users.${username}.extraGroups = [ "adbusers" "plugdev" ];
}
