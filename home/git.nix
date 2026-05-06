{ config, pkgs, ... }:

{
  programs.git = {
    enable    = true;
    userName  = "Pedro Moraes";
    userEmail = "ph.moraes.dev@gmail.com";
  };
}
