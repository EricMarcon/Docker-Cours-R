# Docker pour R
![stability-wip](https://img.shields.io/badge/lifecycle-maturing-blue.svg)


Une image [Docker](https://www.docker.com/) pour exécuter R dans le cadre du cours [Travailler avec R](https://ericmarcon.github.io/Cours-travailleR/) sans se soucier de son installation.
Elle est construite sur l'image [rocker/verse](https://hub.docker.com/r/rocker/verse).
Pour l'utiliser :

- Installer Docker ;
- Construire l'image (le téléchargement peut prendre du temps) :
```
docker build -t cours-r https://github.com/EricMarcon/Docker-Cours-R.git#master
````

- Exécuter l'image. Le mot de passe est à choisir librement, pour se connecter à RStudio (le nom d'utilisateur est obligatoirement "rstudio")
```
docker run -e PASSWORD=<votre_mdp> -p 8787:8787  cours-r
````

Le conteneur Docker n'a par défaut pas de lien avec le système de fichier de sa machine hôte.
Pour échanger des fichiers, utiliser les commandes *Upload* et *Export* de RStudio.
