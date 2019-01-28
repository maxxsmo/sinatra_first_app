require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)# permet de prendre en compte tous fichiers du dossier lib/

require 'controller'
# Fichier rack up qui permet de rassembler les informations nécessaires au lancement de notre serveur <-- code propre.



run ApplicationController # permet d'executer le contenu de la classe ApplicationController


