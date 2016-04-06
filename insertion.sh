
#!/bin/sh

echo "update"
sudo apt-get update -y > /dev/null 2>&1
echo "upgrade"
sudo apt-get upgrade -y  > /dev/null 2>&1
echo "installation de redis-server"
sudo apt-get -y install -y redis-server > /dev/null 2>&1
echo "Etat:"
sudo service redis-server status
echo "lancer redis-server"
sudo service redis-server restart
echo "fin du deploiement"
echo "importation d'une librairie redis-bash-cli"
git clone https://github.com/caquino/redis-bash.git


source redis-bash/redis-bash-lib #inclure la librairie
exec 6<>/dev/tcp/localhost/6379 # ouvrir la connexion
echo "insertions des donnés  dans la base de données redis"
redis-client 6 SET profiles:BrandonAmos  "first : brandon, last: amos, phone:  ~(540)~947~1238, email: bamos@cs.cmu.edu, pdf: /data/cv.pdf ,src :  www.github.com/bamos/cv , url : bamos.github.io , github : bamos , twitter :brandonamos , linkedin :bdamos"
redis-client 6 GET profiles:BrandonAmos
exec 6>&- 
                  
