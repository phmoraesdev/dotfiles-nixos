{ config, pkgs, lib, ... }:

{
  home.username      = "pepe";
  home.homeDirectory = "/home/pepe";
  home.stateVersion  = "25.05";

  programs.home-manager.enable = true;

  # ==========================================
  # PACOTES DO USUÁRIO
  # ==========================================
  home.packages = with pkgs; [
    # Terminal
    kitty

    # Editor
    neovim
    vscodium

    # File manager
    yazi
    ffmpegthumbnailer  # preview de vídeos
    unar               # preview de zips
    poppler            # preview de pdf

    # Dev
    ripgrep
    fd
    dbeaver-bin
    claude-code
    thonny

    # Browser
    firefox
    google-chrome
    tor-browser

    # Aplicativos
    wootility
    steam
    discord
    spotify
    obs-studio
    hydralauncher

    # Mídia e arquivos
    onlyoffice-desktopeditors
    imv
    mpv
    zathura

    # Terminal toys
    btop
    pipes
    peaclock
    cmatrix
    cbonsai
    fastfetch
    lavat

    # Utilitários do usuário
    wl-clipboard
    playerctl
    brightnessctl
    pavucontrol
  ];

  # ==========================================
  # CURSOR
  # ==========================================
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package    = pkgs.bibata-cursors;
    name       = "Bibata-Modern-Classic";
    size       = 24;
  };
  
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "video/mp4"       = "mpv.desktop";
      "video/mkv"       = "mpv.desktop";
      "video/avi"       = "mpv.desktop";
      "video/webm"      = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
    };
  };
  # ==========================================
  # IMPORTS
  # ==========================================
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
  ];
}
