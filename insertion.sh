echo "update"
sudo apt-get update -y > /dev/null 2>&1
echo "upgrade"
sudo apt-get upgrade -y  > /dev/null 2>&1
echo " installation de redis server"
sudo apt-get -y install -y redis-server > /dev/null 2>&1
echo " status du service redis-server"
sudo service redis-server status
echo "lancement du serveur "
sudo service redis-server restart

echo "extraction des données à partir du fichier yaml"
tab=( $( awk -F ":" '{print $1}' exemple.yml) )
tab2=( $( awk -F ":" '{print $2}' exemple.yml) )
chaine=""
i=0
n=${#tab[@]}
while [ "$i" -lt "$(($n -1))" ]
do
chaine="$chaine ${tab[$i]} : ${tab2[$i]},"
((i++))
done
chaine="$chaine ${tab[$i]} : ${tab2[$i]}"
#echo "$chaine"
echo "insertion des données dans la base "
#echo "SET profiles:BrandonAmos  \"first : brandon, last: amos, phone:  ~(540)~947~1238, email: bamos@cs.cmu.edu, pdf: /data/cv.pdf ,src :  www.github.com/bamos/cv , url : bamos.github.io , github : bamos , twitter :brandonamos , linkedin :bdamos\"" | redis-cli
echo "SET Profiles:Brandon \"$chaine\"" | redis-cli

echo "affichage des données du fichier yaml dans la bse de donnée  redis"

echo "GET Profiles:Brandon" | redis-cli





