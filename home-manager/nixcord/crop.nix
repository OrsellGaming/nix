{ pkgs, lib, ... }:

let
  image = ../../wallpapers/wallpaper.png;

  # This resizes the wallpaper located in therepo/wallpapers/wallpaper.png to 1080p (if it isnt already) then crops to a specific size
  # to make it look transparent with the background theme.
  # I spent way too long on this :p

  cropScript = pkgs.writeShellScript "cropsh" ''
    #!/run/current-system/sw/bin/bash
    PNG="$(mktemp -d)/temp_output.png"
        magick "$1" -resize 1920x1080! -crop 1880x1008+20+52 "$PNG"
        mv "$PNG" "$2"
  '';

in
  pkgs.stdenv.mkDerivation {
    pname = "discord-background";
    version = "4.2.0";

    src = image;
    dontUnpack = true;

    buildInputs = [ pkgs.imagemagick ];

    installPhase = ''
      ${cropScript} "$src" "$out"
    '';
  }