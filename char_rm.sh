# Ensure you esacpe you characters on input
# ie. \$ \& \% 
# for question mark use \\\?
# for backslash use \\\\
# for forward slash use \:

dir_depth() {
  cd "$1"
  maxdepth=0
  for d in */.; do
    [ -d "$d" ] || continue
    depth=`dir_depth "$d"`
    maxdepth=$(($depth > $maxdepth ? $depth : $maxdepth))
  done
  echo $((1 + $maxdepth))
}

max_depth=$(dir_depth);

for current_depth in `seq 1 $max_depth`;
do	
	for var in "$@"
	do
		find . -name "*$var*" -maxdepth $current_depth | while read -r f; do mv "$f" "${f//$var/}"; done;
	done
done
