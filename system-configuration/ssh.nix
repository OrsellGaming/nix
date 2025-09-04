#? SSH Config
{ ... }:
{
    programs.ssh = {
        enable = true;
        startAgent = true;
        # Use 1Password to authenticate.
        extraConfig = ''
        Host *
            IdentityAgent "~/.1password/agent.sock";
        '';
    };
}