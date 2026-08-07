{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # ==========================================
  # HOME MANAGER
  # ==========================================
  home-manager.useGlobalPkgs        = true;
  home-manager.useUserPackages      = true;
  home-manager.backupFileExtension  = "backup";
  home-manager.users.pepe = { lib, ... }: {
    home.enableNixpkgsReleaseCheck = false;
    imports = [ /etc/nixos/home.nix ];
  };

  # ==========================================
  # BOOTLOADER
  # ==========================================
  boot.loader.systemd-boot.enable      = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams                    = [ "nvidia_drm.modeset=1" ];

  boot.loader.grub = {
    enable      = true;
    device      = "nodev";
    efiSupport  = true;
    useOSProber = true;
  };

  # ==========================================
  # REDE
  # ==========================================
  # networking.hostName              = "nixos";
  networking.networkmanager.enable = true;

  # ==========================================
  # LOCALIZAÇÃO
  # ==========================================
  time.timeZone      = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT    = "pt_BR.UTF-8";
    LC_MONETARY       = "pt_BR.UTF-8";
    LC_NAME           = "pt_BR.UTF-8";
    LC_NUMERIC        = "pt_BR.UTF-8";
    LC_PAPER          = "pt_BR.UTF-8";
    LC_TELEPHONE      = "pt_BR.UTF-8";
    LC_TIME           = "pt_BR.UTF-8";
  };

  # ==========================================
  # X11 / XWAYLAND
  # ==========================================
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout  = "us";
    variant = "";
  };

  # ==========================================
  # NVIDIA
  # ==========================================
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable     = true;
    open                   = false;
    nvidiaSettings         = true;
    powerManagement.enable = false;
  };

  hardware.graphics = {
    enable      = true;
    enable32Bit = true;
  };

  # ==========================================
  # HYPRLAND
  # ==========================================
  programs.hyprland = {
    enable          = true;
    xwayland.enable = true;
  };

  # Portal XDG (screen share, file picker, etc.)
  xdg.portal = {
    enable       = true;
    extraPortals = [ 
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
    ];
  };

  # ==========================================
  # VARIÁVEIS DE AMBIENTE (NVIDIA + Wayland)
  # ==========================================
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS             = "1";
    GBM_BACKEND                         = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME           = "nvidia";
    LIBVA_DRIVER_NAME                   = "nvidia";
    XDG_SESSION_TYPE                    = "wayland";
    XDG_CURRENT_DESKTOP                 = "Hyprland";
    XDG_SESSION_DESKTOP                 = "Hyprland";
    QT_QPA_PLATFORM                     = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND                  = "1";
    NIXOS_OZONE_WL                      = "1";
    XCURSOR_SIZE                        = "24";
  };

  # ==========================================
  # ÁUDIO (PipeWire)
  # ==========================================
  services.pulseaudio.enable = false;
  security.rtkit.enable      = true;
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
    jack.enable       = true;
  };

  # ==========================================
  # SHELL: FISH
  # ==========================================
  programs.fish.enable = true;

  # ==========================================
  # POLKIT
  # ==========================================
  security.polkit.enable = true;
  security.sudo.extraConfig = ''
    Defaults env_keep += "HOME"
  '';

  # ==========================================
  # IMPRESSÃO
  # ==========================================
  services.printing.enable = true;

  # ==========================================
  # USUÁRIO
  # ==========================================
  users.users.pepe = {
    isNormalUser = true;
    description  = "Pedro Moraes";
    shell        = pkgs.fish;
    extraGroups  = [ "networkmanager" "wheel" "audio" "video" ];
  };

  # ==========================================
  # FONTES
  # ==========================================
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
    ];
    fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif     = [ "Noto Serif" ];
    };
  };

  # ==========================================
  # PACOTES DO SISTEMA
  # ==========================================
  environment.systemPackages = with pkgs; [
    # WM e interface
    hyprland
    waybar
    wofi
    dunst
    wlogout
    hyprlock
    hyprsunset
    swww
    kdePackages.dolphin

    # Screenshot
    grimblast
    grim
    slurp

    # Clipboard
    wl-clipboard

    # Áudio
    pavucontrol

    # Rede
    networkmanagerapplet

    # Polkit
    polkit_gnome

    # Bluetooth
    blueman

    # Utilitários
    xdg-utils
    xdg-user-dirs
    zenity
    zip
    unzip

    # Dev (ferramentas de sistema)
    gcc
    nodejs
    python3
    git
    virtualbox
    wireshark

    # Cursor e tema
    bibata-cursors
    adwaita-qt6
  ];

  # ==========================================
  # CONFIGURAÇÕES GERAIS
  # ==========================================
  services.displayManager.ly.enable = true;

  programs.firefox.enable    = true;
  nixpkgs.config.allowUnfree = true;
  hardware.wooting.enable    = true;

  nix.gc = {
    automatic = true;
    dates     = "weekly";
    options   = "--delete-older-than 7d";
  };

  # ==========================================
  # VERSÃO DO SISTEMA
  # ==========================================
  system.stateVersion = "25.05";
}
