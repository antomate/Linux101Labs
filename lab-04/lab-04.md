- Cloner un repos avec un template de VM linux (+Public IP + NSG port 80 + Additional disk)
- Ajouter au template l'extension custom script (pointe vers un fichier pas encore créé sur URI)
- Créer une clé SSH pour se connecter à sa machine (SSH)
- Ajouter la public key dans le template (SSH)
- Créer des scripts batch pour (MAN+EXPORT+TOUCH+GREP+PWD+FIND+CHMOD+MKDIR) :
	1. Créer un utilisateur et un groupe pour run as du service web (gestion user et groupe)
	2. Formater et monter le nouveau disque pour accueillir le serveur web
	3. Télécharger et configurer Ngnix (package manager+)
	3. Télécharger la page d'accueil
- Assembler les différents scripts + uploader pour mise à disposition custom script
- Déployer le template de VM et se connecter sur son port 80 pour afficher le site
- Se connecter en SSH et éditer la page d'accueil pour changer le message de bienvenu et redémarer le service web (SSH+SUDO+LS+CD+EDITORS)
- Vérifier les mises à jour disponible (package manager)
- Tails des logs
- Redémarrer la VM (shutdown)