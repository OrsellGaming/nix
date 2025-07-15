# WALLPAPER MANAGER
while :; do
  if [[ $(date +%T) < 19:00:00 ]] || [[ $(date +%T) > 6:00:00 ]]; then # before 7 PM or after 6 AM (daytime)
    mpvpaper --mpv-options "--loop-file=300" ALL ~/.wallpapers/spill-animated.mp4
    mpvpaper --mpv-options "--loop-file=120" ALL ~/.wallpapers/ila-animated.mp4
  elif [[ $(date +%T) > 19:00:00 ]] && [[ $(date +%T) < 23:00:00 ]]; then # after 7 PM AND before 11pm
    mpvpaper --mpv-options "--loop-file=500" ALL ~/.wallpapers/overthrower-animated.mp4
  else # 11:00 PM -> 5:59 AM
    mpvpaper --mpv-options "--loop-file=1200" ALL ~/.wallpapers/team.mp4
  fi
done
