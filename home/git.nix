{ config, pkgs, ... }:

{
  programs.git = {
    enable    = true;
    settings.user.name  = "Pedro Moraes";
    settings.user.email = "ph.moraes.dev@gmail.com";
  };
}
