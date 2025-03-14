{ config, lib, pkgs, ... }: {
  hardware.graphics = { enable = true; };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = false;

    package = config.boot.kernelPackages.nvidiaPackages.latest;

  };

}
