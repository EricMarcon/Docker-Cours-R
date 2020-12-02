# Image Docker pour les cours R
#
FROM rocker/verse

LABEL maintainer="Eric Marcon"
LABEL GitHub="https://github.com/EricMarcon/Docker-Cours-R"

RUN apt-get update

# Package.R est copié pour l'utilisateur rstudio
COPY Packages.R /home/rstudio/

# Mode salle de classe #
# Décommenter les commandes RUN
# Droits d'administration pour rstudio (pour créer des utilisateurs par exemple)
# Equivalent à -e ROOT=TRUE dans docker run
#  RUN usermod -a -G sudo rstudio
# Création des utilisateurs
# Une ligne par utilisateur, remplacer (trois fois) prenom.nom par le nom d'utilisateur
#  RUN useradd -m -d /home/prenom.nom -p "$(openssl passwd -1 prenom.nom)" prenom.nom
