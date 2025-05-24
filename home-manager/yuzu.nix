# {config, pkgs, ...}:

# let
#   pkgssuyu = import
#     (builtins.fetchTarball {
#         url = "https://github.com/NixOS/nixpkgs/archive/a476cb19a61342cb52a971f108d070cbf53fd59f.tar.gz";
#         sha256 = "1hpwbsqr816d19658vgjrpq02ic1fmp9hch5l3a6h6irvj8gavh5";
#         }
#     )
#     # reuse the current configuration
#     { inherit (pkgs) system; };
# in
# {
#     home.packages = with pkgssuyu; [
#         torzu
#     ];
# }
