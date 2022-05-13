# Das person und Passwort file mergen
# Delimiter ist leerschlag, und in person.txt ist
# die ID der dritte parameter, wegen leerschlag im namen
join -t " " -1 3 -2 1 textfiles/Person.txt textfiles/Passwort.txt  

# Alle foxn.txt files ausgeben
# sortieren und duplikate löschen
cat textfiles/fox*.txt | sort | uniq

# testfile ausgeben, mit uniq duplikate löschen 
# und mit -c vorkommnise zählen
# Zu letzt mit sort -n nach anzahl sortieren
cat textfiles/testfile.txt | uniq -c | sort -n

