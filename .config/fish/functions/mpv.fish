function mpv
  if count $argv>/dev/null
	  command mpv $argv
  else
	  command mpv *
  end
end
