{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono NFM";
      size = 12;
    };
    settings = {
      shell                     = "${pkgs.fish}/bin/fish";
      cursor_trail              = 1;
      background_opacity        = "0.80";
      window_padding_width      = 5;

      foreground                = "#ffffff";
      background                = "#000000";
      selection_foreground      = "#000000";
      selection_background      = "#ffffff";

      cursor                    = "#ffffff";
      cursor_text_color         = "#000000";

      url_color                 = "#d4d4d4";

      active_border_color       = "#000000";
      inactive_border_color     = "#000000";
      bell_border_color         = "#ffffff";
      visual_bell_color         = "none";

      wayland_titlebar_color    = "system";
      macos_titlebar_color      = "system";

      active_tab_foreground     = "#ffffff";
      active_tab_background     = "#000000";
      inactive_tab_foreground   = "#b9b9b9";
      inactive_tab_background   = "#000000";
      tab_bar_background        = "none";
      tab_bar_margin_color      = "none";

      mark1_foreground          = "#000000";
      mark1_background          = "#ffffff";
      mark2_foreground          = "#000000";
      mark2_background          = "#d4d4d4";
      mark3_foreground          = "#000000";
      mark3_background          = "#b9b9b9";

      color0  = "#262626"; color8  = "#262626";
      color1  = "#646464"; color9  = "#646464";
      color2  = "#8e8e8e"; color10 = "#8e8e8e";
      color3  = "#b9b9b9"; color11 = "#b9b9b9";
      color4  = "#989898"; color12 = "#989898";
      color5  = "#747474"; color13 = "#747474";
      color6  = "#585858"; color14 = "#585858";
      color7  = "#d4d4d4"; color15 = "#d4d4d4";

      disable_ligatures         = "never";
      text_composition_strategy = "legacy";
    };
    shellIntegration.enableFishIntegration = true;
  };
}
