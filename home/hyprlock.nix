{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprlock.conf".text = ''
    monitor =

    background {
        path  = /home/pepe/Pictures/Wallpapers/silver-surfer.png
        color = rgb(0, 0, 0)
    }

    input-field {
        size              = 250, 50
        outline_thickness = 2
        dots_size         = 0.33
        dots_spacing      = 0.15
        dots_center       = true

        outer_color = rgb(60, 60, 60)
        inner_color = rgb(40, 40, 40)
        font_color  = rgb(255, 255, 255)

        placeholder_text = <i>Password...</i>
        hide_input       = false
        fade_on_empty    = false

        position = 0, -50
        halign   = center
        valign   = center
    }

    label {
        text        = $TIME
        color       = rgb(255, 255, 255)
        font_size   = 64
        font_family = Sans
        position    = 0, 250
        halign      = center
        valign      = center
    }

    label {
        text        = cmd[update:1000] echo "$(date '+%d/%m/%Y')"
        color       = rgb(200, 200, 200)
        font_size   = 20
        font_family = Sans
        position    = 0, 180
        halign      = center
        valign      = center
    }

    label {
        text        = Bem-vindo, $USER
        color       = rgb(150, 150, 150)
        font_size   = 18
        font_family = Sans
        position    = 0, 0
        halign      = center
        valign      = center
    }
  '';
}
