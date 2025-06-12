{ pkgs, lib, ... }:
let
  wallpaperImg = ../../wallpapers/wallpaper.png;
in {

    home.packages = with pkgs; [
        hyprpolkitagent
        rofi
        hyprpaper
        grim
        slurp
        swappy
        wl-clipboard
        libnotify
        dunst
        nerd-fonts.caskaydia-cove
        font-awesome
        lm_sensors
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;
        settings = {
            exec-once = [
                "waybar"
                "systemctl --user start hyprpolkitagent"
                "[workspace 1 silent] code"
                "[workspace 2 silent] firefox"
                "[workspace 5 silent] kitty"
            ];

            "monitor" = "HDMI-A-1, 1920x1080@60, 0x0, 1";
            "$terminal" = "kitty";
            "$mod" = "alt";
            "$fileManager" = "dolphin";

            bind = [
                "SUPER, SUPER_L, exec, pkill rofi || rofi -show drun"
                "$mod, q, exec, $terminal"
                ", Print, exec, ~/.config/hypr/scripts/screenshot rc"
                "alt, w, killactive"

                # Workspaces
                "control, 1, workspace, 1"
                "control, 2, workspace, 2"
                "control, 3, workspace, 3"
                "control, 4, workspace, 4"
                "control, 5, workspace, 5"
                "control, 6, workspace, 6"
                "control, 7, workspace, 7"
                "control, 8, workspace, 8"
                "control, 9, workspace, 9"
                "alt, mouse_down, workspace, e-1"
                "alt, mouse_up, workspace, e+1"
            ];

            binds = {
                "scroll_event_delay" = "0";
            };

            input = {
                # "name" = "sigmachip-usb-mouse";
                "sensitivity" = "0.2";
                "accel_profile" = "flat";
                "follow_mouse" = "2";
            };

            general = {
                "col.active_border" = "rgba(27F274ee) rgba(3BFFFFee) 45deg";
                "col.inactive_border" = "rgba(ffff50ee) rgba(c97d2dee) 45deg";
                "border_size" = "5";
                "resize_on_border" = "true";
                "extend_border_grab_area" = "10";
                "hover_icon_on_border" = "true";
            };

            decoration = {
                # "rounding" = "5";
                # "rounding_power" = "4";
                # "inactive_opacity" = "0.9";
                # shadow = {
                #     "enabled" = "true";
                #     "range" = "10";
                #     "color" = "rgb(0, 0, 0)";
                # };
            };

            misc = {
                "focus_on_activate" = "true";
            };

            windowrule = [
                "opacity .95 override .95,class:Code"
            ];
        };
    };
    programs.waybar.enable = true;
    services.hyprpaper = {
        enable = true;
        settings = {
            "preload" = "${wallpaperImg}";
            "wallpaper" = ", ${wallpaperImg}";
        };
    };

    # Waybar configuration
    fonts.fontconfig.enable = true;
    home.file.".config/waybar" = {
        source =  ./waybar; 
        recursive = true;
    };

    # Lock screen
    programs.hyprlock = {
        enable = true;

        settings = {
            # for more configuration options, refer https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock

            general = {
                hide_cursor = false;
            };

            animations = {
                enabled = true;
                bezier = "linear, 1, 1, 0, 0";
                animation = [
                    "fadeIn = 1, 5, linear"
                    "fadeOut = 1, 5, linear"
                    "inputFieldDots = 1, 2, linear"
                ];
            };

            background = {
                monitor = "";
                path = "${wallpaperImg}";
                blur_passes = 3;
            };

            input-field = [
                {
                    monitor = "";
                    size = "20%, 5%";
                    outline_thickness = 3;
                    inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

                    outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                    check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
                    fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

                    font_color = "rgb(143, 143, 143)";
                    fade_on_empty = false;
                    rounding = 15;

                    font_family = "Monospace";
                    placeholder_text = "Input password...";
                    fail_text = "$PAMFAIL";

                    # uncomment to use a letter instead of a dot to indicate the typed password
                    # dots_text_format = *
                    # dots_size = 0.4
                    dots_spacing = 0.3;

                    # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
                    # hide_input = true;

                    position = "0, -20";
                    halign = "center";
                    valign = "center";
                }
            ];

            # TIME
            label = [
                {
                    monitor = "";
                    text = "$TIME12"; # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution
                    font_size = 90;
                    font_family = "Monospace";

                    position = "-30, 0";
                    halign = "right";
                    valign = "top";
                }
                {
                    # DATE
                    monitor = "";
                    text = ''cmd[update:60000] date +"%Y %m %d, %A"''; # update every 60 seconds
                    font_size = 25;
                    font_family = "Monospace";

                    position = "-30, -150";
                    halign = "right";
                    valign = "top";
                }
                # {
                #     monitor = "";
                #     text = "$LAYOUT[en]";
                #     font_size = 24;
                #     onclick = "hyprctl switchxkblayout all next";

                #     position = "250, -20";
                #     halign = "center";
                #     valign = "center";
                # }
            ];
        };

    };

    # Screenshots
    home.file.".config/hypr/scripts/screenshot" = {
        executable = true;
        text = ''
            #!/run/current-system/sw/bin/bash

            # Flags:

            # r: region
            # s: screen
            #
            # c: clipboard
            # f: file
            # i: interactive

            # p: pixel

            if [[ $1 == rc ]]; then
                grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | wl-copy
                notify-send 'Copied to Clipboard' Screenshot

            elif [[ $1 == rf ]]; then
                mkdir -p ~/Pictures/Screenshots
                filename=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
                grim -g "$(slurp -b '#000000b0' -c '#00000000')" $filename
                notify-send 'Screenshot Taken' $filename

            elif [[ $1 == ri ]]; then
                grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | swappy -f -

            elif [[ $1 == sc ]]; then
                filename=~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png
                grim - | wl-copy
                notify-send 'Copied to Clipboard' Screenshot

            elif [[ $1 == sf ]]; then
                mkdir -p ~/Pictures/Screenshots
                filename=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
                grim $filename
                notify-send 'Screenshot Taken' $filename

            elif [[ $1 == si ]]; then
                grim - | swappy -f -

            elif [[ $1 == p ]]; then
                color=$(hyprpicker -a)
                wl-copy $color
                notify-send 'Copied to Clipboard' $color
            fi
        '';
    };
}
