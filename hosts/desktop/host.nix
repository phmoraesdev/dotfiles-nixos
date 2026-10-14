# ============================================================
# Host: desktop
# CPU: AMD | GPU: NVIDIA (proprietária)
# ============================================================

{ config, pkgs, ... }:

{
  networking.hostName = "desktop";

  # ==========================================
  # GRUB (dual boot)
  # ==========================================
  boot.loader.grub = {
    enable      = true;
    device      = "nodev";
    efiSupport  = true;
    useOSProber = true;
  };

  # ==========================================
  # NVIDIA
  # ==========================================
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable     = true;
    open                   = false;
    nvidiaSettings         = true;
    powerManagement.enable = false;
  };

  environment.sessionVariables = {
    GBM_BACKEND                = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME  = "nvidia";
    LIBVA_DRIVER_NAME          = "nvidia";
  };

  # ==========================================
  # TECLADO WOOTING (analógico)
  # ==========================================
  hardware.wooting.enable = true;
}
