{ pkgs, lib, ... }:
let
  wallpaperImg = ../../wallpapers/Illustration156.png;
in {

    home.packages = with pkgs; [
        kitty
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
                "control, w, killactive"

                # Workspaces
                "control, 1, workspace, 1"
                "control, 2, workspace, 2"
                "control, 3, workspace, 3"
                "control, 4, workspace, 4"
                "control, 5, workspace, 5"
            ];

            input = {
                # "name" = "sigmachip-usb-mouse";
                "sensitivity" = "0.2";
                "accel_profile" = "flat";
            };
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
