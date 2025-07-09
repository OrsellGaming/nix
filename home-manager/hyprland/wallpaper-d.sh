# WALLPAPER MANAGER
while :; do
  if [[ $(date +%T) < 19:00:00 ]] || [[ $(date +%T) > 6:00:00 ]]; then # before 7 PM or after 6 AM (daytime)
    mpvpaper --mpv-options "--loop-file=300" ALL ~/.wallpapers/spill-animated.mp4
    mpvpaper --mpv-options "--loop-file=120" ALL ~/.wallpapers/ila-animated.mp4
  else # night time
    mpvpaper --mpv-options "--loop-file=250" ALL ~/.wallpapers/overthrower-animated.mp4
    mpvpaper --mpv-options "--loop-file=600" ALL ~/.wallpapers/team.mp4
  fi
done
