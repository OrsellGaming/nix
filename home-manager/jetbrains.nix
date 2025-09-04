# JetBrains IDE Programs
{ pkgs, ... }:
{
   home.packages = with pkgs; [
        jetbrains.rider
        jetbrains.clion
    ];

    # JetBrains Remote Development System
    programs.jetbrains-remote = {
        enable = true;
        ides = [ # JetBrains IDEs to allow with the system
            pkgs.jetbrains.rider
            pkgs.jetbrains.clion
        ];
    };
}