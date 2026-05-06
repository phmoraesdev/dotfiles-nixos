{ config, pkgs, lib, ... }:

{
  home.username      = "pepe";
  home.homeDirectory = "/home/pepe";
  home.stateVersion  = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    playerctl
    brightnessctl
    fastfetch
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package    = pkgs.bibata-cursors;
    name       = "Bibata-Modern-Classic";
    size       = 24;
  };

  imports = [
    ./home/hyprland.nix
    ./home/hyprlock.nix
    ./home/waybar.nix
    ./home/kitty.nix
    ./home/fish.nix
    ./home/dunst.nix
    ./home/wofi.nix
    ./home/wlogout.nix
    ./home/fastfetch.nix
    ./home/git.nix
    ./home/nvim.nix
    ./home/gtk.nix
  ];
}
