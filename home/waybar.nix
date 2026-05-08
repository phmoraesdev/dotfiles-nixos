{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
      }

      #waybar {
        background: rgba(0, 0, 0, 0.5);
        color: #ffffff;
      }

      #clock {
        color: #ffffff;
      }

      #workspaces button {
        color: #737373;
        padding: 0px 4px;
        margin: 4px 0px;
        border-radius: 2px;
        background-color: transparent;
        transition: all 0.3s cubic-bezier(.4, 0, .2, 1);
      }

      #workspaces button.active {
        background-color: rgba(163, 160, 157, 1);
        color: rgba(0, 0, 0, 1);
        border-radius: 4px;
      }

      #tray {
        padding-left: 4px;
      }

      #window {
        color: #ffffff;
      }

      #temperature,
      #memory,
      #cpu,
      #pulseaudio,
      #battery,
      #custom-nightmode,
      #custom-bluetooth,
      #network,
      #custom-powermenu {
        color: #ffffff;
        margin-right: 12px;
      }
    '';

    settings = [{
      layer         = "top";
      position      = "top";
      margin-bottom = 0;

      modules-left   = [ "hyprland/workspaces" "tray" ];
      modules-center = [ "clock" ];
      modules-right  = [
        "temperature"
        "memory"
        "cpu"
        "pulseaudio"
        "battery"
        "custom/nightmode"
        "custom/bluetooth"
        "network"
        "custom/powermenu"
      ];

      tray = {
        icon-size = 16;
        spacing   = 8;
      };

      clock = {
        format         = "󰸗 {:%I:%M %p} ";
        interval       = 60;
        tooltip        = true;
        tooltip-format = "{:%d %B %H:%M}";
        on-click       = "zenity --calendar --width=300 --height=300 --title='Calendário'";
      };

      "hyprland/workspaces" = {
        format           = "{icon}";
        separate-outputs = false;
        active-only      = false;
        all-outputs      = false;
        format-icons     = {
          "1" = "1"; "2" = "2"; "3" = "3"; "4" = "4"; "5" = "5";
          "6" = "6"; "7" = "7"; "8" = "8"; "9" = "9"; "10" = "10";
        };
      };

      temperature = {
      format             = "{icon} {temperatureC}°C ";
      hwmon-path         = "/sys/class/hwmon/hwmon2/temp1_input";
      critical-threshold = 80;
      format-icons       = [ "󰈸" "󰈸" "󰸁" ];
};

      memory = {
        format  = "󰫗 {}% ";
        tooltip = false;
      };

      cpu = {
        format  = "󰍛 {usage}% ";
        tooltip = false;
      };

      pulseaudio = {
        format      = "󰕾 {volume}% ";
        scroll-step = 1;
        on-click    = "pavucontrol";
      };

      "custom/nightmode" = {
        exec        = "bash -lc '~/.config/waybar/scripts/hyprsunset.sh status'";
        return-type = "json";
        interval    = 2;
        tooltip     = true;
        on-click    = "bash -lc '~/.config/waybar/scripts/hyprsunset.sh toggle'";
        on-click-right = "bash -lc 'pkill hyprsunset'";
      };

      "custom/bluetooth" = {
        exec           = "echo \"󰂯 \"";
        interval       = 0;
        tooltip        = true;
        tooltip-format = "Bluetooth";
        on-click       = "blueman-manager";
        on-click-right = "blueman-adapters";
      };

      network = {
        format         = "󰖩 ";
        tooltip-format = "{essid}";
        interval       = 2;
        on-click       = "kitty -e nmtui";
      };

      battery = {
        format       = "{capacity}% {icon}";
        format-icons = [ "" "" "" "" "" ];
      };

      "custom/powermenu" = {
        format   = "⏻";
        tooltip  = false;
        on-click = "exec wlogout -p layer-shell";
      };
    }];
  };

  home.file.".config/waybar/scripts/hyprsunset.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      set -u

      NIGHT_TEMP=3500
      DAY_TEMP=6500

      have() { command -v "$1" >/dev/null 2>&1; }

      ensure_running() {
        if have systemctl && systemctl --user list-unit-files hyprsunset.service >/dev/null 2>&1; then
          systemctl --user start hyprsunset.service >/dev/null 2>&1 || true
          return 0
        fi
        if ! pgrep -x hyprsunset >/dev/null 2>&1; then
          hyprsunset >/dev/null 2>&1 &
          disown 2>/dev/null || true
        fi
      }

      get_temp() {
        local out num
        out="$(hyprctl hyprsunset temperature 2>/dev/null || true)"
        num="$(printf '%s' "$out" | grep -oE '[0-9]+' | head -n1 || true)"
        if [[ -n "''${num:-}" ]]; then
          printf '%s\n' "$num"
        else
          printf '%s\n' "$DAY_TEMP"
        fi
      }

      set_temp() {
        local t="$1"
        hyprctl hyprsunset temperature "$t" >/dev/null 2>&1 || true
      }

      toggle() {
        if pgrep -x hyprsunset >/dev/null 2>&1; then
          pkill hyprsunset
        else
          hyprsunset -t $NIGHT_TEMP &
          disown
        fi
      }

      status() {
        local icon tooltip cur
        icon="󰖨 "
        tooltip="Night Mode Off"
        if ! have hyprctl; then
          printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
          exit 0
        fi
        if ! pgrep -x hyprsunset >/dev/null 2>&1; then
          printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
          exit 0
        fi
        cur="$(get_temp)"
        if [[ "$cur" -le $((DAY_TEMP - 1)) ]]; then
          icon=" "
          tooltip="Night Mode On"
        fi
        printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
      }

      case "''${1:-status}" in
        toggle) toggle ;;
        status) status ;;
        *) exit 1 ;;
      esac
    '';
  };
}
