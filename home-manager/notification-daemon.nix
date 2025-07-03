{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dunst
  ];

  home.file.".config/dunst/dunstrc" = {
    text = ''
      [global]
        sort = update
    '';
  };
}
