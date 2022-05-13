# Check if params correct
if [ -z $1 ] || [ $# != 1 ]; then
  echo "Anzahl Linien und Wörter in einer Datei auslesen"
  echo "wordcount.sh file1"
  exit
fi

# Check if params are files
if [ ! -f $1 ]; then
  echo "$1 is not a file."
  exit
fi

# Print line numbers
nl $1

# Print wordcount
echo "### LINE AND WORD COUNT ###"
wc -wl $1