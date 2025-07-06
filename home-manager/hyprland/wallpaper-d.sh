
while :; do
  if [[ $(date +%T) < 19:00:00 ]]; then
    mpvpaper --mpv-options "--loop-file=300 --reset-on-next-file=loop-file" ALL ~/.wallpapers/playlist-day.m3u
  else
    mpvpaper --mpv-options "--loop-file=300 --reset-on-next-file=loop-file" ALL ~/.wallpapers/playlist-night.m3u
  fi
done
