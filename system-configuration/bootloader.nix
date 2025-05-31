{pkgs, ...}:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      device = "nodev";

      theme = pkgs.stdenv.mkDerivation {
      pname = "HyperFluent";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
          owner = "Back-Slash-N";
          repo = "HyperFluent-GRUB-Theme";
          rev = "50a69ef1c020d1e4e69a683f6f8cf79161fb1a92";
          hash = "sha256-l6oZqo6ATv9DWUKAe3fgx3c12SOX0qaqfwd3ppcdUZk=";
      };
      installPhase = "cp -r nixos $out";
      };
    };
  };
}
