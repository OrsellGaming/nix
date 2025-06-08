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
                "control, mouse_down, workspace, e-1"
                "control, mouse_up, workspace, e+1"
            ];

            binds = {
                "scroll_event_delay" = "0";
            };

            input = {
                # "name" = "sigmachip-usb-mouse";
                "sensitivity" = "0.2";
                "accel_profile" = "flat";
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
                "rounding" = "5";
                "rounding_power" = "4";
                "inactive_opacity" = "0.9";
                shadow = {
                    "enabled" = "true";
                    "range" = "10";
                    "color" = "rgb(0, 0, 0)";
                };
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
