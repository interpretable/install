#set machine id
#curl ifconfig.me > ip.txt

value=`cat ip.txt`
echo "$value"

url=`https://interpretable.erasme.org/api/public/api/machine/$INTERPRETABLEID`

#echo $url
#echo $INTERPRETABLEID

#Get ip and send to API
curl -d '{"ip":"'$value'"}' -H "Content-Type: application/json" -X POST "https://interpretable.erasme.org/api/public/api/machine/"$INTERPRETABLEID""
