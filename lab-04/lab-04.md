- Depuis WSL ou Windows, créer des scripts batch pour :
	1. Créer un utilisateur et un groupe pour run as du service web (gestion user et groupe)
	2. Télécharger et configurer Ngnix (package manager+)
	3. Modifier le compte par défault pour le run de Ngnix
	3. Télécharger une page d'accueil depuis un URI
- Assembler les différents scripts + uploader pour mise à disposition custom script
- Depuis WSL Modifier le template VM existant :
	- Ajouter une règle pour autoriser le port 80 en inbound depuis le tag "Internet"
	- Ajouter au template l'extension custom script (pointe vers un fichier pas encore créé sur URI)
- Déployer le template de VM et se connecter sur son port 80 pour afficher le site
- Se connecter en SSH et éditer la page d'accueil pour changer le message de bienvenu et redémarer le service web