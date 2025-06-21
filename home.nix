{ config
, pkgs
, inputs
, lib
, ... }:

{
  home.username = "n";
  home.homeDirectory = "/home/n";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    lutris
    gale
    qbittorrent
    vlc
    vpkedit
    bottles
    jdk21
    quickemu
    gimp-with-plugins
    lazygit
    sidequest
    uget
    mpv
    yazi
    modrinth-app
  ];

  imports = [
    # ./home-manager/default-applications.nix
    ./home-manager/firefox.nix
    ./home-manager/git.nix
    ./home-manager/nixcord/nixcord.nix
    ./home-manager/bash.nix
    ./home-manager/fastfetch/fastfetch.nix
    ./home-manager/obs.nix
    ./home-manager/vscode/vscode.nix
    ./home-manager/kitty.nix
    ./home-manager/nh.nix
    ./home-manager/hyprland/hyprland.nix
  ];

  # packages.someDotnetApplication6 = {
  #   pkgs.buildDotnetModule rec {
  #     pname = "some_program"; version = "some_version"
  #   };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";



  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
