<#
.Synopsis
   Récupération de nouvelles CVE à partir d'un flux RSS

.DESCRIPTION
   -Script qui récupère un flux RSS pour le parser dans un fichier CSV
   -En tâche planifiée sur un serveur afin de s'éxécuter de manière hebdomadaire
   -Optionnel : Envoi du CSV par mail (nécessite un serveur SMTP)

.EXAMPLE
   Purple Team suivi du patching

.Auteur
   Guillaume DUPONT

   gdupont-sdv sur GitHub
#>

clear

#CVE details RSS (par défaut) vous pouvez remplacer l'url de cette variable par le flux RSS de votre choix
$url_rss_feed = 'https://www.cvedetails.com/vulnerability-feed.php?vendor_id=0&product_id=0&version_id=0&orderby=1&cvssscoremin=0'

#Exemple
#Microsoft Security Update Guide RSS
#'https://api.msrc.microsoft.com/update-guide/rss'

# Date
$date = Get-Date -Format ddMMyy_hhmm

# Chemin du csv
$csv_out_file = "$PSScriptRoot\export_csv\$($date)_CVE.csv"


# Invoke-WebRequest équivalent de curl en powershell
$temp = Invoke-WebRequest $url_rss_feed -OutFile "$PSScriptRoot/temp/temp.xml"


# Déclarer variable et le type xml
[xml]$content_xml = Get-Content "$PSScriptRoot/temp/temp.xml"

#Parsing RSS to get item
$Feed = $content_xml.rss.channel
$Objects_in_feed = $Feed.Item


# Nombre de résultats trouvés
$items_number =  $Objects_in_feed.Count
Write-Host -ForegroundColor Green "$items_number résultats trouvés sur le feed $url_rss_feed"


# Afficher les liens dans la console powershell
$Objects_in_feed.link


#exportation des objects dans un CSV
$Objects_in_feed | Export-Csv -Path $csv_out_file  -Delimiter ';' -NoTypeInformation

# commentez la ligne suivante pour masquer le résultat dans une fenêtre native windows (Out-GridView)
$Objects_in_feed | Out-GridView



# /!\ Décommentez pour l'envoi du csv par mail /!\
<#
#$creds = Get-Credential       #Décommentez si authentification requise sur votre serveur SMTP

$smtp_server = ''               # IP de votre SMTP Server
$from = ''                      # adresse d'envoi
$to = ''                        # adresse de destination
$Attachments = $csv_out_file    # chemin du fichier à joindre au mail


$object = ""     # objet du mail
$body = ""       # corps du mail


Send-MailMessage -From $from -To $to -SmtpServer $smtp_server -Subject $object -Body $body -Attachments $Attachments #-Credential $creds

#>


    
#End

pause 



