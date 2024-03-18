{config, pkgs, myconfig, ...}:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec  "$@"
  '';
  intelBusId = myconfig.hosts.${myconfig.host}.intelBusId;
  nvidiaBusId = myconfig.hosts.${myconfig.host}.nvidiaBusId;
in
{
  services.xserver.videoDrivers = [ "intel" "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    inherit intelBusId nvidiaBusId;
  };

  environment.systemPackages = with pkgs; [
    nvidia-offload
  ];
}