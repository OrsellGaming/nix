{ pkgs, ... }:
{
  home.packages = with pkgs; [
    quickshell # Please go to DotFiles to activate NixOS.
  ];

  home.file.".config/quickshell/shell.qml" = {
    source = ./shell.qml;
  };
}