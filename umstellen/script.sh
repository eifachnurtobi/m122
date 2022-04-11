#!/bin/bash

# File einlesen
if [ -z $1 ] || [ -z $2 ] || [ $# != 2 ]; then
  echo "script.sh file output"
  exit
fi

if [ ! -f $1 ]; then
  echo "$1 is not a file."
  exit
fi

if [ -f $2 ]; then
  echo "$2 already exists."
  exit
fi


# Filtern nach deutschen einträgen
# 2 26 ist nicht deutsch, mit grep -v entfernen
grep $'^2\t' $1 | grep -v $'^2\t26' > entries_german

# Iterieren über einträge
while read entry; do
    # Nach tab splitten geht hier nicht, da tabs in variablen
    # zu spaces umgewandelt werden. ( Im unterricht besprochen)

    # Erste beiden kolonnen entfernen
    relevantColumns="$( echo $entry | cut -d ' ' -f3- )"

    # Die erste kolonne nehmen, und anführungszeichen entfernen
    article="$( echo $relevantColumns | cut -d ' ' -f1 | tr -d "'" )"
    # Die zweite kolonne bis ende Zeile nehmen, und anführungszeichen verwenden
    name="$( echo $relevantColumns | cut -d ' ' -f2- | tr -d "'" )"

    # Die beiden gewünschten werte wieder tab separiert auf eine
    # zeile bringen, und ans output file anhängen
    echo $article$'\t'$name >> $2
done < entries_german

# gefilterte liste wieder löschen
rm entries_german

