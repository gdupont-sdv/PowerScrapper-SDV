# PowerScrapper-SDV

Prérequis : 

- Machine Windows (avec execution de scripts powershell possible)
- Accès internet pour récupérer le flux web (RSS)

Optionnel
- Un serveur SMTP pour alerter par mail


# Installation : 

## Téléchargez l'archive sur le git et décompressez la

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/247a24b5-3110-4047-bdd6-8498d9552382)


# Exécution :

## Exécutez le script (le résultat s'affiche dans une page native Windows Out-GridView)

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/eaeaf017-98c2-4813-a9f0-37895e6b9194)

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/43dded13-bd90-41a4-a264-f0b7acd62ea0)


## Dans le dossier "export_csv" vous retrouvez le CSV daté correspondant

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/d46d2ad5-df55-4627-a0de-ebcfb12799fb)


## Editez le script pour changer la variable $url_rss_feed afin de selectionner le flux RSS de votre choix

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/bbb0dae1-2b4c-48d5-b9be-315b71cc47b2)

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/cefbddf6-4822-4cf0-959c-9b84e663b5bf)

## Peut s'exécuter en tâche planifiée
![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/44fec7cf-d6c1-4114-8e75-73ff3a9ea86d)

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/2a78732c-a3b6-4e6c-8807-c0ca2a4931cc)

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/6e1514da-bec8-42cc-8514-9b7ed967b7bd)

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/b1db3b47-fcb0-456d-9738-452b8623da04)

# Envoi du rapport CSV aux équipes  (nécessite un serveur SMTP)

## Décommentez le bloc de code et renseignez les informations d'envoi du mail et le serveur SMTP, le fichier CSV est déjà en pièce jointe

![image](https://github.com/gdupont-sdv/PowerScrapper-SDV/assets/134785181/61a6fd47-ad4b-4ffc-8853-601bb104b51d)




 



