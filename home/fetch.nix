{ config, pkgs, ... }:
{
  home.file.".config/fetch/config".text = ''
    os
    host
    kernel
    uptime
    packages
    shell
    wm
    terminal
    cpu
    gpu
    memory
    disk
    colors

    label_color=white
    speed=1.0
    size=1.0
    spin=xy
  '';
}
