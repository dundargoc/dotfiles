function ss
  if count $argv >/dev/null
	  gnome-screenshot -d $argv
  else
	  gnome-screenshot
  end
end
