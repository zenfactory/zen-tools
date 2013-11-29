#!/bin/bash
webRoot='/opt/web'
siteRoot='veda-mobile.zenfactory.org'
backupDir='/opt/backups'
archiveName="veda-mobile.zenfactory.org-`date +%s`.tgz"
cd $webroot
tar -czvf $backupDir/$archiveName $webRoot/$siteRoot
