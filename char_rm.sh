# Ensure you esacpe you characters on input
# ie. \$ \& \% 
# for backslash use \\\\
# for forward slash use \:

for var in "$@"
do
	find . -name "*$var*" | while read -r f; do echo mv "$f" "${f//$var/}"; done
done

echo "Do you wish to perform the renames?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
			for var in "$@"
			do
				find . -name "*$var*" | while read -r f; do mv "$f" "${f//$var/}"; done;
			done
		break;;
        No ) exit;;
    esac
done
