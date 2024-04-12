{config, pkgs, pkgs-unstable, myconfig, inputs, ...}:
let
  user = myconfig.user.name;
  lib = pkgs.lib;
in
{
# system level

programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
};

  # home-manager level
  home-manager.users.${user} = {
    home.packages = (with pkgs; [

      (retroarch.override {
        cores = with libretro; [
          genesis-plus-gx
          snes9x
          beetle-psx-hw
        ];
      })
    ]) ++ (with pkgs-unstable; []) ++[ ];
  };
}
