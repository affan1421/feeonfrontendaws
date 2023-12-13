#!/bin/bash
set -e


#_Change_Working_Directory
cd /home/ubuntu/server

#_Update_&_Set_Node_Version
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -

#_Download_Node_&NPM
apt -y install nodejs npm

#_Download_PM2
npm install pm2@latest -g
