# TSGL_PPA
Calvin's TSGL PPA to host Debian Packages

## Install Process
```
curl -s --compressed "https://RyanVreeke.github.io/TSGL_PPA/tsgl/KEY.gpg" | sudo apt-key add -  
sudo curl -s --compressed -o /etc/apt/sources.list.d/my_list_file.list "https://RyanVreeke.github.io/TSGL_PPA/tsgl/my_list_file.list"  
sudo apt update  
sudo apt install tsgl
```

## Sources:

https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html  
https://github.com/assafmo/ppa/blob/master/update.sh
