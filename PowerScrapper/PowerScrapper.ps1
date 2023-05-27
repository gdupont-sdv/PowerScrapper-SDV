<#
.Synopsis
   R�cup�ration de nouvelles CVE � partir d'un flux RSS

.DESCRIPTION
   Description d�taill�e
.EXAMPLE
   Purple Team suivi du patching
.EXAMPLE
   Autre exemple de l�usage de cette applet de commande

.Auteur
   Guillaume DUPONT
#>

clear

$date = Get-Date -Format ddMMyy

$csv_out_file = "$PSScriptRoot\export_csv\$($date)_cve.csv"


#CVE details RSS (par d�faut) vous pouvez remplacer l'url de cette variable par le flux RSS de votre choix
#Exemple
##Microsoft Security Update Guide RSS
#'https://api.msrc.microsoft.com/update-guide/rss'
$url_rss_feed = 'https://www.cvedetails.com/vulnerability-feed.php?vendor_id=0&product_id=0&version_id=0&orderby=1&cvssscoremin=0'


#Exemple
##Microsoft Security Update Guide RSS
#'https://api.msrc.microsoft.com/update-guide/rss'


# Invoke-WebRequest �quivalent de curl en powershell
$temp = Invoke-WebRequest $url_rss_feed -OutFile "$PSScriptRoot/temp/temp.xml"



# D�clarer variable et le type xml
[xml]$content_xml = Get-Content "$PSScriptRoot/temp/temp.xml"

#Parsing RSS to get item
$Feed = $content_xml.rss.channel
$Objects_in_feed = $Feed.Item


# Nombre de r�sultats trouv�s
$items_number =  $Objects_in_feed.Count
Write-Host -ForegroundColor Green "$items_number r�sultats trouv�s sur le feed $url_rss_feed"


# Afficher les liens dans la console powershell
$Objects_in_feed.link


#exportation des objects dans un CSV
$Objects_in_feed | Export-Csv -Path $csv_out_file  -Delimiter ';' -NoTypeInformation

# commentez la ligne suivante pour masquer le r�sultat dans une fen�tre native windows (Out-GridView)
$Objects_in_feed | Out-GridView



# /!\ D�commentez pour l'envoi du csv par mail /!\
<#
#$creds = Get-Credential       #D�commentez si authentification requise sur votre serveur SMTP

$smtp_server = ''    # mettre votre SMTP Server
$from = ''           # adresse d'envoi
$to = ''             # adresse de destination
$Attachments = ''    # chemin du fichier � joindre au mail

$object = "test"     # objet du mail
$body = "test"       # corps du mail


Send-MailMessage -From $from -To $to -SmtpServer $smtp_server -Subject $object -Body $body -Attachments $Attachments #-Credential $creds

#>


    
#End

pause 



