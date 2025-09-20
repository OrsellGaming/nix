#* System Theming
{ pkgs, ... }:
{
  # TODO: Themes are not fully applying to all applications (i.e Dolphin)
  gtk = {
    enable = true;
    theme = {
      name = "Nightfox-Dark"; #"Breeze-Dark";
      package = pkgs.nightfox-gtk-theme; #pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "Breeze-Icons";
      package = pkgs.kdePackages.breeze-icons;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "Nightfox-Dark";
      package = pkgs.nightfox-gtk-theme;
    };
  };
}
