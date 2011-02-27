#!/usr/bin/env bash

BACKUP_PATH=/Volumes/GPG\ Backup

if [[ -d "$BACKUP_PATH" ]]; then
    
    pushd ~/
    tar -cvzf "temp.tar.gz" .gnupg/
    mv "temp.tar.gz" "${BACKUP_PATH}/gnupg/gnupg_$(date +%d-%m-%y).tar.gz"
    popd
    
    pushd ~/.dotfiles
    tar -cvzf "temp.tar.gz" gpg/ 
    mv "temp.tar.gz" "${BACKUP_PATH}/gpg/gpg_$(date +%d-%m-%y).tar.gz"
    popd

    pushd ~/.dotfiles
    tar -cvzf "temp.tar.gz" .passwords.gpg 
    mv "temp.tar.gz" "${BACKUP_PATH}/passwords/passwords_$(date +%d-%m-%y).tar.gz"
    popd

    pushd ~/
    tar -cvzf "temp.tar.gz" .ssh/ 
    mv "temp.tar.gz" "${BACKUP_PATH}/ssh/ssh_$(date +%d-%m-%y).tar.gz"
    popd

else 
    echo -e "\nBackup volume ${BACKUP_PATH}/ is missing!"
    echo -e "Please attach the volume and try again.\n"
fi

