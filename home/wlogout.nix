{ config, pkgs, ... }:

{
  home.file.".config/wlogout/layout".text = ''
    {
        "label" : "lock",
        "action" : "hyprlock",
        "text" : "Lock",
        "keybind" : "l"
    }
    {
        "label" : "hibernate",
        "action" : "systemctl hibernate",
        "text" : "Hibernate",
        "keybind" : "h"
    }
    {
        "label" : "logout",
        "action" : "hyprctl dispatch exit",
        "text" : "Logout",
        "keybind" : "e"
    }
    {
        "label" : "shutdown",
        "action" : "systemctl poweroff",
        "text" : "Shutdown",
        "keybind" : "s"
    }
    {
        "label" : "suspend",
        "action" : "hyprlock & disown && systemctl suspend",
        "text" : "Suspend",
        "keybind" : "u"
    }
    {
        "label" : "reboot",
        "action" : "systemctl reboot",
        "text" : "Reboot",
        "keybind" : "r"
    }
  '';

  home.file.".config/wlogout/style.css".text = ''
    * {
        background-image: none;
        box-shadow: none;
    }

    window {
        background-color: rgba(255, 255, 255, 0.2);
    }

    button {
        margin: 8px;
        border-width: 2px;
        border-radius: 30;
        border-color: rgba(255, 255, 255, 0.5);
        color: #000000;
        background-color: rgba(255, 255, 255, 0.7);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        box-shadow: 0px 0px 0px black;
        opacity: 0.7;
        transition: opacity 100ms ease-in;
    }

    button:hover {
        background-color: #ffffff;
        border-color: rgba(0, 0, 0, 0.2);
        opacity: 1;
    }

    #lock {
        background-image: image(
            url("icons/lock.png"),
            url("/usr/local/share/wlogout/icons/lock.png")
        );
    }

    #logout {
        background-image: image(
            url("icons/logout.png"),
            url("/usr/local/share/wlogout/icons/logout.png")
        );
    }

    #suspend {
        background-image: image(
            url("icons/suspend.png"),
            url("/usr/local/share/wlogout/icons/suspend.png")
        );
    }

    #hibernate {
        background-image: image(
            url("icons/hibernate.png"),
            url("/usr/local/share/wlogout/icons/hibernate.png")
        );
    }

    #shutdown {
        background-image: image(
            url("icons/shutdown.png"),
            url("/usr/local/share/wlogout/icons/shutdown.png")
        );
    }

    #reboot {
        background-image: image(
            url("icons/reboot.png"),
            url("/usr/local/share/wlogout/icons/reboot.png")
        );
    }
  '';
}
