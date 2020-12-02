# Docker pour R
![stability-wip](https://img.shields.io/badge/lifecycle-maturing-blue.svg)


Une image [Docker](https://www.docker.com/) pour exécuter R dans le cadre du cours [Travailler avec R](https://ericmarcon.github.io/Cours-travailleR/) sans se soucier de son installation.
Elle est construite sur l'image [rocker/verse](https://hub.docker.com/r/rocker/verse).

## Utilisation individuelle

Pour l'utiliser sur un poste de travail avec Docker :

- Installer Docker ;
- Construire l'image (le téléchargement peut prendre du temps) :
```
docker build -t cours-r https://github.com/EricMarcon/Docker-Cours-R.git#master
````

- Exécuter l'image. Le mot de passe est à choisir librement, pour se connecter à RStudio (le nom d'utilisateur est obligatoirement "rstudio")
```
docker run -e PASSWORD=<choisir_mdp> -p 8787:8787  cours-r
````
Ouvrir la page http://localhost:8787/ et se connecter à RStudio en tant que "rstudio".

Le conteneur Docker n'a par défaut pas de lien avec le système de fichier de sa machine hôte.
Pour échanger des fichiers, utiliser les commandes *Upload* et *Export* de RStudio.

## Utilisation collective

Pour une salle de classe, RStudio Server fonctionne sur une machine dédiée (le serveur) qui héberge le conteneur Docker.
Les utilisateurs ouvrent la page http://adresse_du_serveur:8787/ et se connectent à RStudio avec leur propre identifiant.

Le compte "rstudio" est réservé à l'enseignant qui peut installer des packages dans la librairie système; contrairement aux utilisateurs.

- Installer Docker sur le serveur ;
- [Télécharger le dépôt](https://github.com/EricMarcon/Docker-Cours-R/archive/master.zip), extraire le contenu du fichier zip dans un nouveau dossier et ouvrir une console dans ce dossier ;
- Modifier le fichier `Dockerfile` pour créer les utilisateur en modifiant la ligne modèle (<prenom.nom> est le nom de chaque utilisateur) :
```
RUN useradd -rm -d /home/<prenom.nom> -s /bin/bash -p "$(openssl passwd -1 <prenom.nom>)" --no-log-init <prenom.nom>
```

- Construire l'image
```
docker build -t cours-r .
````

- Exécuter l'image. Le mot de passe est celui de l'utilisateur "rstudio":
```
docker run -e PASSWORD=<choisir_mdp> -p 8787:8787  cours-r
````

Le compte "rstudio" peut ajouter d'autres utilisateurs après la création du conteneur en exécutant en tant que superutilisateur la même commande `useradd` que ci-dessus, dans le terminal de RStudio.

Chaque utilisateur se connecte à RStudio à partir de son poste de travail.
Son mot de passe par défaut est identique à son identifiant.
Pour le modifier, il doit exécuter la commande `passwd` dans le terminal de RStudio.
