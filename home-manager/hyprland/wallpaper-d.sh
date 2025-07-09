# WALLPAPER MANAGER
while :; do
  if [[ $(date +%T) < 19:00:00 ]]; then # before 7 pm
    mpvpaper --mpv-options "--loop-file=300" ALL ~/.wallpapers/spill-animated.mp4
    mpvpaper --mpv-options "--loop-file=120" ALL ~/.wallpapers/ila-animated.mp4
  else
    mpvpaper --mpv-options "--loop-file=250" ALL ~/.wallpapers/overthrower-animated.mp4
    mpvpaper --mpv-options "--loop-file=600" ALL ~/.wallpapers/team.mp4
  fi
done
