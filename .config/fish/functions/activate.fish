function activate
  # Function for quick virtual environment activation.
	set activate_file (find . -type f -name "activate")
	set number_of_files (echo $activate_file | wc -l)

	if test $number_of_files -eq 0
		echo "No activate file found. Exiting."
		return 1
	else if test $number_of_files -gt 1
		echo "Multiple activate files found:"
		echo "$activate_file"
		echo "Exiting."
		return 1
	end

	bass source $activate_file
end
