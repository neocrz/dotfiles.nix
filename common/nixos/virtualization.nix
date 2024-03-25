{config, pkgs, myconfig, ...}:
let
  username = myconfig.user.name;
in
{

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.waydroid.enable = true;

  users.users.${username}.extraGroups = [ "libvirtd" "docker" ];

  nixpkgs.config.cudaSupport = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;
  virtualisation.docker.extraOptions = "--add-runtime nvidia=/run/current-system/sw/bin/nvidia-container-runtime";
  virtualisation.podman.enable = true;
  
  boot.extraModulePackages = [ ];

  environment.systemPackages = with pkgs; [
    docker-compose  
  ];
}
