#? GTK Theming
{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "Breeze-Icons";
      package = pkgs.kdePackages.breeze-icons;
    };
  };
}
