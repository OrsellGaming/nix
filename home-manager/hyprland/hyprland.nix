#* DISPLAY/WINDOW MANAGER
{ pkgs, lib, ... }:
{
  imports = [
    ./hyprlock.nix #? Hyprland Lock Screen
  ];

  #? WALLPAPERS
  # TODO: Implement rest of backgrounds
  home.file = {
    ".wallpapers" = { source = ../../wallpapers; recursive = true; };
    ".wallpapers/wallpaper-d.sh" = { source = ./wallpaper-d.sh; executable = true; };
  };

  home.packages = with pkgs; [
    hyprpolkitagent # Authentication Manager
    mpvpaper # Video Wallpaper Manager
    grim # Screenshot utils (x3)
    slurp
    swappy
    wl-clipboard
    font-awesome
    catppuccin-cursors.mochaSapphire
    jq # Used for detecting if a special workspace is active when switching to a numbered workspace
  ];

  # TODO: Change out cursor, as well as change the one GTK applicaitons use to the same so its consistent.
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = { # TODO: Port this all to a hyprland.conf file instead of all being crammed into here.
      exec-once = [
        "systemctl --user enable --now hyprpolkitagent.service"
        "systemctl --user enable --now waybar.service"
        "rog-control-center" # ASUS system control, supergfx and asusctl
        "1password --silent" # Startup 1Password in the background
        "~/.wallpapers/wallpaper-d.sh" # Wallpapers
        "teams-for-linux"
        "[workspace 1 silent] kitty tmux"
        # "[workspace 1 silent] code"
        # "[workspace 2 silent] firefox"
        "[workspace 6 silent] kitty btop"
        "[workspace 6 silent] kitty nvitop"
        "[workspace special:magic silent] vesktop"
      ];

      "monitor" = [
        "eDP-2, 2560x1600@240.0, 1920x0, 1.0"
        "HDMI-A-1, 1920x1080@240.0, 0x230, 1.0"
      ];

      "$terminal" = "kitty";
      "$mod" = "alt";

      bind = [
        # Application menu
        "SUPER, SUPER_L, exec, pkill rofi || rofi -show drun"
        "$mod, TAB, exec, pkill rofi || rofi -show window"

        # Lock computer
        "SUPER, l, exec, hyprlock"

        # Terminal Shortcut
        "$mod, q, exec, $terminal tmux"

        # Selective Screenshot
        "SUPER_SHIFT, s, exec, ~/.config/hypr/scripts/screenshot rc"

        # Selective Screenshot to File # TODO
        # "SUPER_SHIFT,"

        # OBS Clip Hotkey
        ", F8, pass, class:^(com\.obsproject\.Studio)$"

        # ", code:156, 

        # Open 1Password quick access menu.
        "control SHIFT, SPACE, exec, 1password --quick-access"

        # Close Window
        "$mod, w, killactive"

        # Pin window to make it always visible on all workspaces
        "$mod, p, pin"

        # Floating windows
        "alt, f, togglefloating"

        # Execution
        # ", code:87, exec, ~/.discord-slasher.sh 0" # Orsell
        # ", code:88, exec, ~/.discord-slasher.sh 1" # Bob
        # ", code:89, exec, ~/.discord-slasher.sh 2" # Deepfried
        # ", code:83, exec, ~/.discord-slasher.sh 0 1"
        # ", code:84, exec, ~/.discord-slasher.sh 1 1"
        # ", code:85, exec, ~/.discord-slasher.sh 2 1"
        
        # Move application between workspaces
        "control SHIFT, 1, movetoworkspace, 1"
        "control SHIFT, 2, movetoworkspace, 2"
        "control SHIFT, 3, movetoworkspace, 3"
        "control SHIFT, 4, movetoworkspace, 4"
        "control SHIFT, 9, movetoworkspace, 9" 
        "control SHIFT, 5, movetoworkspace, 5"
        "control SHIFT, 6, movetoworkspace, 6"
        "control SHIFT, 7, movetoworkspace, 7"
        "control SHIFT, 8, movetoworkspace, 8"

        # Overlayed workspace (like steam ingame overlay)
        "$mod, d, togglespecialworkspace, magic"
        "$mod SHIFT, d, movetoworkspace, special:magic"
        "$mod CONTROL, d, movetoworkspace, 1"

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

        # Hide Special workspaces if active
        # Taken from https://www.reddit.com/r/hyprland/comments/1b6bf39/comment/ktfscyz/
        "control, 1, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 2, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        # "control, 3, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 4, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 5, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 6, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 7, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 8, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "control, 9, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "alt, mouse_down, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
        "alt, mouse_up, exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"

      ];

      bindm = [
        # Floating windows
        "alt, mouse:272, movewindow"
      ];

      binds = {
        "scroll_event_delay" = "0";
        "drag_threshold" = "10";
      };

      input = {
        # "name" = "sigmachip-usb-mouse";
        "sensitivity" = "0.2";
        "accel_profile" = "flat";
        "follow_mouse" = "2";
      };

      general = {
        "col.active_border" = "rgb(27F274) rgb(3BFFFF) 45deg";
        "col.inactive_border" = "rgb(ffff50) rgb(c97d2d) 45deg";

        "border_size" = "4";
        "resize_on_border" = "true";
        "extend_border_grab_area" = "10";
        "hover_icon_on_border" = "true";
      };

      decoration = {
        # "rounding" = "5";
        # "rounding_power" = "4";
        # "inactive_opacity" = "0.9";
        # shadow = {
        #   "enabled" = "true";
        #   "range" = "10";
        #   "color" = "rgb(0, 0, 0)";
        # };
      };

      animations = {
        "animation" = "specialWorkspace, 1, 3, default, slidefadevert -50%";
      };

      misc = {
        "focus_on_activate" = "true";
        "disable_hyprland_logo" = "true";
      };

      windowrule = [
        "opacity .95 override .95, class:Code"
        #"workspace 1, class:Code"
        "bordercolor rgb(6600a1) rgb(ff5100) 0deg rgb(6600a1) rgb(ff5100) 0deg,floating:1"
        "workspace special:magic, class:vesktop"
        "bordersize 0, pinned:1"
        "float, initialTitle:Picture-in-Picture"
        "pin, initialTitle:Picture-in-Picture"
        "size 552 310, initialTitle:Picture-in-Picture"
        "float, initialTitle:Discord Popout"
        "pin, initialTitle:Discord Popout"
        "size 552 310, initialTitle:Discord Popout"
      ];
    };
    extraConfig = ''
      # Toggle ignoring non-special workspace binds
      bind=$mod, ESCAPE, exec, notify-send "Game mode enabled!"
      bind=$mod, ESCAPE, submap, gamemode
      submap = gamemode

      # Toggle off
      bind=$mod, ESCAPE, exec, notify-send "Game mode disabled!"
      bind=$mod, ESCAPE, submap, reset

      # Keep overlay workspace
      bind=$mod, d, togglespecialworkspace, magic

      # OBS Clip Hotkey
      bind=, F8, pass, class:^(com\.obsproject\.Studio)$

      # Full Screenshot
      bind=SUPER_SHIFT, s, exec, ~/.config/hypr/scripts/screenshot sc

      # End of special bind set
      submap = reset
    '';
  };

  #? Screenshot Script For Hyprland
  home.file.".config/hypr/scripts/screenshot" = {
    executable = true;
    source = ./screenshot;
  };
}
