# ============================================================
# Host: thinkpad
# ThinkPad X1 Carbon | CPU: Intel | GPU: Intel (integrada)
# ============================================================

{ config, pkgs, ... }:

{
  networking.hostName = "thinkpad";

  # ==========================================
  # SYSTEMD-BOOT (sem dual boot)
  # ==========================================
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.enable         = false;

  # ==========================================
  # GPU INTEL
  # ==========================================
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
