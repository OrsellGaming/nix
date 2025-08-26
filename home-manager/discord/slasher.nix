{ config, ... }:
{
  home.file.".discord-slasher.sh" = {
    text = ''
      #ORSELL=0
      #BOB=1
      #DEEPFRIED_WAFFLES=2
      userids=("217027527602995200" "676527931325153280" "597626316749144076")
      action="DELETE"
      DISCORD_TOKEN="Authorization: $(cat ${config.sops.secrets.discord-token.path})"
      USER_AGENT="User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36"

      if [[ ''${2} == 1 ]]; then
        action="PUT"
        curl --request POST \
          --url https://discord.com/api/v9/channels/1272260847674331137/send-soundboard-sound \
          --header "$DISCORD_TOKEN" \
          --header "Content-Type: application/json" \
          --header "$USER_AGENT" \
          --data '{
            "sound_id": "3",
            "emoji_id": null,
            "emoji_name": "🦗"
          }'
      else
        curl --request POST \
          --url https://discord.com/api/v9/channels/1272260847674331137/send-soundboard-sound \
          --header "$DISCORD_TOKEN" \
          --header "Content-Type: application/json" \
          --header "$USER_AGENT" \
          --data '{
            "sound_id": "5",
            "emoji_id": null,
            "emoji_name": "🎺"
          }'
      fi

      sleep 0.3

      curl --request $action \
      --url https://discord.com/api/v9/channels/1272260847674331137/recipients/''${userids[$1]} \
      --header "$DISCORD_TOKEN" \
      --header "$USER_AGENT"
    '';
    executable = true;
  };
}
