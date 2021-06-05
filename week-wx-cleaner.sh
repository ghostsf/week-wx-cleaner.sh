# mac微信附件等资源保留，自动迁移备份到nas，并清理本地释放空间
#! /bin/bash
clean_days=365
echo 'WX MessageTemp cleaner start ...'
echo 'clean days' ${clean_days}
cd /Users/ghostsf/Library/Containers/com.tencent.xinWeChat/Data/Library/Application\ Support/com.tencent.xinWeChat/2.0b4.0.9/fc4cea7edb2dde38c6ba91c9f1a5f288/Message/MessageTemp
echo 'find these MessageTemp files: '
backupDate=`date +%Y%m%d`
backupDir=/Users/ghostsf/ghostsf/im-backup/wx/${backupDate}-${clean_days}
find ./ -mtime "+$clean_days" -exec sh -c '
  mkdir -p "$0/${1%/*}"
  mv -v "$1" "$0/$1"
' "$backupDir" {} \;