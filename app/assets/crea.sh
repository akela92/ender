#! /bin/bash
echo "Creando directorio"
mkdir /var/lib/one/escenarios/$1
#Crear archivo resources
echo $2 | cut -d ":" -f 1 >> /var/lib/one/escenarios/$1/resources
echo $2 | cut -d ":" -f 2 >> /var/lib/one/escenarios/$1/resources
num=$(echo $2 | cut -d ":" -f 3) #Num de mv que

#Copia las plantillas y archivos vpn al directorio
let cont=1
while [ $cont -le $num ]; do
        aux=$(echo $3 | cut -d ":" -f $cont)
        echo $aux >> /var/lib/one/escenarios/$1/pmvs
        cp /var/lib/one/plantillas/$aux /var/lib/one/escenarios/$1/
let cont=$cont+1
done
cp /var/lib/one/plantillas/red.net /var/lib/one/escenarios/$1/$1.net
cp /var/lib/one/plantillas/ca.crt /var/lib/one/escenarios/$1/
cp /var/lib/one/plantillas/client.ovpn /var/lib/one/escenarios/$1/
#RENOMBRA LAS PLANTILLAS
echo "Renombrando"
sleep 35;
while read line
do
       id=$(cat /var/lib/one/escenarios/$1/$line | grep NAME | cut -d '"' -f 2)
       cat /var/lib/one/escenarios/$1/$line | sed 's/NAME="'$id'"/NAME="'$1"_"$$
       mv /var/lib/one/escenarios/$1/aux /var/lib/one/escenarios/$1/$line
done < /var/lib/one/escenarios/$1/pmvs
cat /var/lib/one/escenarios/$1/$1.net | sed 's/NAME="UCM"/NAME="'$1'"/g' > /var$
mv /var/lib/one/escenarios/$1/aux.net /var/lib/one/escenarios/$1/$1.net

#orden="/var/lib/one/despliega.sh "$1
#/var/lib/one/despliega.sh $1
#$orden
echo "FIN"
