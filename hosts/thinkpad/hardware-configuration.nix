# ============================================================
# PLACEHOLDER — ainda não gerado.
#
# Depois de instalar o NixOS no ThinkPad X1 Carbon, rode:
#   sudo nixos-generate-config --dir /tmp/hwcfg
# e substitua o conteúdo deste arquivo pelo
# /tmp/hwcfg/hardware-configuration.nix gerado lá
# (ajustando os imports se necessário).
#
# Não use `nixos-generate-config` direto em /etc/nixos aqui
# porque ele sobrescreveria configuration.nix também.
# ============================================================
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # Placeholder — substitua pelos UUIDs reais da máquina.
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/00000000-0000-0000-0000-000000000000";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0000-0000";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
