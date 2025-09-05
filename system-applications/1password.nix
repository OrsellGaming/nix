#* 1Password Configuration
{ pkgs, ... }:
{
    programs._1password.enable = true;
    programs._1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "orsell" ];
    };
}