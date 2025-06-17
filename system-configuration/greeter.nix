{pkgs, lib, ...}:
# let
#   lockscreen-image = pkgs.stdenvNoCC.mkDerivation {
#     name = "image";
#     src = ../wallpapers/lockscreen.png;
#     dontUnpack = true;
#     installPhase = ''
#       cp $src $out
#     '';
#   };
# in
{
  # Login manager configuration
  services.displayManager = {
    enable = true;
    cosmic-greeter = {
      enable = true;
      # theme = "breeze";
      # wayland.enable = true;
      # package = pkgs.sddm;
    };
  };
  # systemd.services.displayManager
}
