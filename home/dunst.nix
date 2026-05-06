{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor              = 0;
        follow               = "mouse";
        width                = 320;
        height               = 120;
        origin               = "top-right";
        offset               = "20x40";
        gap_size             = 0;

        background           = "#2d2d2d";
        foreground           = "#e6e6e6";
        frame_color          = "#3d3d3d";
        frame_width          = 0;
        transparency         = 0;
        corner_radius        = 4;

        font                 = "Monospace 10";

        icon_position        = "left";
        min_icon_size        = 24;
        max_icon_size        = 48;

        notification_limit   = 10;
        stack_duplicates     = true;
        hide_duplicate_count = true;

        format               = "<b>%s</b>\\n%b";
        alignment            = "left";
        word_wrap            = true;
        separator_height     = 1;
        separator_color      = "#3d3d3d";
        padding              = 10;
        horizontal_padding   = 12;
        text_icon_padding    = 8;

        timeout              = 4;
      };

      urgency_low = {
        background = "#2d2d2d";
        foreground = "#999999";
        timeout    = 3;
      };

      urgency_normal = {
        background = "#2d2d2d";
        foreground = "#e6e6e6";
        timeout    = 4;
      };

      urgency_critical = {
        background  = "#332222";
        foreground  = "#ffffff";
        frame_color = "#cc5555";
        frame_width = 1;
        timeout     = 0;
      };
    };
  };
}
