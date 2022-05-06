# Projektidee

Ich habe eine unübersichtliche Ordnerstruktur, in der Files gebackupt werden. Manche dieser Dateien sind mehrfach vorhanden, was aufgrund von speicherplatzgründen suboptimal ist. Ich habe deswegen ein Bash Skript erstellt, welches rekursiv alle Dateien in einem Ordner hasht und vergleicht um Duplikate zu finden. Ich habe mich für hashes entschieden, um z.B. probleme bei ungleichen dateien mit gleichem Namen, oder gleichen dateien mit ungleichem Namen zu vermeiden.

![UML Diagramm](UML_Diagram.png?raw=true)
