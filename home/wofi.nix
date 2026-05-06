{ config, pkgs, ... }:

{
  home.file.".config/wofi/config".text = ''
    show=drun
    width=40%
    height=50%
    prompt=Search...
    normal_window=true
    location=center
    gtk-dark=true
    allow_images=true
    image_size=32
    insensitive=true
    allow_markup=true
    no_actions=true
    orientation=vertical
    halign=fill
    content_halign=fill
  '';

  home.file.".config/wofi/style.css".text = ''
    window {
      background: #0a0a0a;
    }

    * {
      font-family: "Jetbrains Mono";
      color: #fff;
    }

    #scroll {
      padding: 0.5rem;
    }

    #input {
      background-color: #171717;
      outline: none;
      box-shadow: none;
      border: 0;
      border-radius: 0;
      font-size: 1rem;
      padding-left: 1rem;
      padding-right: 1rem;
      padding-top: 0.5rem;
      padding-bottom: 0.5rem;
    }

    #inner-box {
      margin: 0.5rem;
      font-size: 1rem;
    }

    #img {
      margin: 10px 10px;
    }

    #entry {
      border-radius: 0.5rem;
    }

    #entry:selected {
      background-color: #262626;
      outline: none;
    }
  '';
}
