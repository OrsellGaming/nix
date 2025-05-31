{pkgs, lib, ...}:
let
  # Define the custom background package with the correct relative path
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "background-image";
    src = ../wallpapers/Illustration157.png;
    dontUnpack = true;
    installPhase = ''
      cp $src $out
    '';
  };
in
{
  # Login manager configuration
    services.displayManager.sddm = {
      enable = lib.mkDefault true;
      theme = "breeze";
      wayland.enable = true;
    };
  environment.systemPackages = with pkgs; [
      (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background = "${background-package}"
      '')
  ];
}
