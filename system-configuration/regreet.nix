#* Regreet System Display Manager
{ pkgs, lib, ... }:
{
  programs.regreet = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 16;
    };
    theme = {
      name = "Nightfox-Dark";
      package = pkgs.nightfox-gtk-theme;
    };
    iconTheme = {
      name = "Breeze-Icons";
      package = pkgs.kdePackages.breeze-icons;
    };
    settings = {
      application_prefer_dark_theme = true;
    };
  };

  # TODO: This is suppose to fix a issue with the greeter
  # TODO: having a 20 second start up delay.
  #! TODO: It's not working, figure it out! 
  environment.etc."greetd/hyprland.conf".text = ''
    env = GTK_USE_PORTAL,0
    env = GDK_DEBUG,no-portals
  '';
}