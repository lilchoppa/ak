#!/bin/bash

#########################################################
# Diretorio de backup (saida)
backup_saida="/root/server/worlds"
# Diretorio de backup (destino)
backup_destino="/root/backup"
#########################################################

# formato do arquivo
date_format=$(date "+%d/%m/%Y-%T")
arquivo_final="backup_$date_format.tar.gz"

# Local de amarzenamento do log

log_file="/root/backup/mserver-backup.log" >> $log_file

#########################################################
# Começo do backup
#########################################################

if tar -czSpf "$backup_destino/$arquivo_final" "$backup_saida"; then
    printf "($date_format) o backup foi feito corretamente!."\n >> $log_file
else printf "($date_format) o backup não foi feito corretamente!."
fi

#########################################################
# exlui os arquivos quando tiver mais de 6 dias
find $backup_destino -mtime +6 -delete
