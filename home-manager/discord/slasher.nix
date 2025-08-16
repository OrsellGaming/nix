{ config, ... }:
{
  home.file.".discord-slasher.sh" = {
    text = ''
      #ORSELL=0
      #BOB=1
      #DEEPFRIED_WAFFLES=2
      userids=("217027527602995200" "676527931325153280" "597626316749144076")
      action="DELETE"

      if [[ ''${2} == 1 ]]; then
        action="PUT"
      fi

      export DISCORD_TOKEN=$(cat ${config.sops.secrets.discord-token.path})
      curl --request $action \
      --url https://discord.com/api/v9/channels/1272260847674331137/recipients/''${userids[$1]} \
      --header "Authorization: $DISCORD_TOKEN" \
      --header "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36"
    '';
    executable = true;
  };
}
