{config, ...}:
{
  # KDE Plasma configuration
  services.desktopManager.plasma6.enable = true;
  systemd.user.services.set-wallpaper = {
      enable = true;
      description = "Set KDE Plasma wallpaper";
      serviceConfig.ExecStart = [ "/run/current-system/sw/bin/plasma-apply-wallpaperimage /etc/nixos/wallpapers/Illustration157.png" ];
      wantedBy = [ "plasma-workspace.target" ];
      after = [ "plasma-workspace.target" ];
    };
}
