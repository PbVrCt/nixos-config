sessionizer_find() {
	# Run fdfind for the initial search
	fd -H -d 1 -t d -E .Trash . "$HOME/projects/" | while read -r dir; do
		if [ -d "$dir/.bare" ]; then
			if [ -d "$dir/master" ]; then
				echo "$dir/master"
			elif [ -d "$dir/main" ]; then
				echo "$dir/main"
			else
				echo "$dir"
			fi
		else
			echo "$dir"
		fi
	done
	# Check and append additional directories to the search results if they exist
	for dir in "$HOME/.config/nixos/" "$HOME/vault/"; do
		if [ -d "$dir" ]; then
			echo "$dir"
		fi
	done
}
