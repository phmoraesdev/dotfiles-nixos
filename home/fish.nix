{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting ""

      set -l azul     6CB6FF
      set -l verde    5FD7A7
      set -l vermelho FF6B6B
      set -l cinza    8A8F98

      function fish_prompt
          set_color $azul --bold
          echo -n (prompt_pwd)

          if git rev-parse --is-inside-work-tree >/dev/null 2>&1
              set_color $verde
              echo -n " | "(git branch --show-current)
          end

          echo

          if test $status -eq 0
              set_color $verde --bold
              echo -n "› "
          else
              set_color $vermelho --bold
              echo -n "! "
          end

          set_color normal
      end

      function fish_right_prompt
          set_color $cinza
          echo -n "→ "(whoami)
          set_color normal
      end
    '';

    shellAliases = {
      ls         = "ls --color=auto";
      ff         = "fastfetch";
      nixrebuild = "sudo nixos-rebuild switch";
      nixedit    = "sudo nvim /etc/nixos/configuration.nix";
      hmedit     = "sudo nvim /etc/nixos/home.nix";
      wootility  = "cd ~ && wootility";
    };
  };
}
