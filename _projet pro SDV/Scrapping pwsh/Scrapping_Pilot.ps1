<#
.Synopsis
   Récupération de nouvelles CVE à partir d'un flux RSS

.DESCRIPTION
   Description détaillée
.EXAMPLE
   Purple Team suivi du patching
.EXAMPLE
   Autre exemple de l’usage de cette applet de commande

.Auteur
   Guillaume DUPONT
#>

clear

$date = Get-Date -Format ddMMyy

$csv_out_file = "$PSScriptRoot\export_csv\$($date)_cve.csv"


#CVE details RSS (par défaut) vous pouvez remplacer l'url de cette variable par le flux RSS de votre choix
#Exemple
##Microsoft Security Update Guide RSS
#'https://api.msrc.microsoft.com/update-guide/rss'
$url_rss_feed = 'https://www.cvedetails.com/vulnerability-feed.php?vendor_id=0&product_id=0&version_id=0&orderby=1&cvssscoremin=0'
$url_rss_feed = 'https://api.msrc.microsoft.com/update-guide/rss'

#Exemple
##Microsoft Security Update Guide RSS
#'https://api.msrc.microsoft.com/update-guide/rss'


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

# Décommentez la ligne suivante pour afficher le résultat dans une fenêtre native windows (Out-GridView)
#$Objects_in_feed | Out-GridView

#exportation des objects dans un CSV
$Objects_in_feed | Export-Csv -Path $csv_out_file  -Delimiter ';' -NoTypeInformation



# /!\ Décommentez pour l'envoi du csv par mail /!\
<#

#$creds = Get-Credential       #Décommentez si authentification requise sur votre serveur SMTP

$smtp_server = 'email-smtp.us-east-2.amazonaws.com'
$from = 'nirvadrix@gmail.com'
$to = 'nirvadrix@gmail.com'


$object = "test"
$body = "test"

Send-MailMessage -From $from -To $to -SmtpServer $smtp_server -Subject $object -Body $body #-Credential $creds


#>

    
#End
pause 



