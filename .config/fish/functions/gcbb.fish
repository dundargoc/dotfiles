function gcbb
	git checkout -b $argv
	git push --set-upstream origin $argv
end
