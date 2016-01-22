# videogames.pixelastic.com

## Install

This repo is a mix of Ruby and Python.

Ruby is used for Middleman, the static website generator. Python is used by the
Youtube upload script.

You can install all needed Ruby dependecies with a simple `bundle install`, but
you'll have to manually install [youtube-upload][1]



/index.html
Simple. Liste des jeux avec des vignettes media

/tomb-raider-2013/
Liste de toutes les photos/vidéos, groupées par catégorie
Peut-etre les glitches de coté
lightbox au clic pour navigueur au clavier
overlay sur les vidéos

compresser les images ?
sources/images/{slug}
Image de fond pour le style? Pomper du site officiel if need be

data/tomb-raider-2013.json
[
title:
description:
sections:
  title: glitches
  items:
    "/path/to/file.jpg",
    "/path/to/file.mp4"

  title: gameplay
  items:
]

Et à coté un fichier de conversion avec le nom .mp4, et le code youtube
si présent on utilise youtube




[1]: https://github.com/tokland/youtube-upload
