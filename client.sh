
for var in {1..10..1}
do
    datetime=$(date +"%T")
	echo "{id:'ogrencino',no:'$var',msg:'packet from client', timestamp:$datetime}" | socat - tcp4:localhost:5001 #tcp4 connect
	echo "$var- CLIENT-->{TCP4}: {packet from client}{$var}}{$datetime}" >> client.txt                            #write on client.txt
	echo "TCP4-->{id:'ogrencino',no:'$var',msg:'packet from client', timestamp:$datetime}"                        #show on console
done
for var in {1..10..1}
do
    datetime=$(date +"%T")
	echo "{id:'ogrencino',no:'$var',msg:'packet from client',timestamp:$datetime}" | socat - UDP4-DATAGRAM:localhost:5001 #udp connect
	echo "$var- CLIENT-->{UDP4}:{packet from client}{$i}{$datetime}" >> client.txt                                        #write on client.txt
	echo "UDP4-->{id:'ogrencino',no:'$var',msg:'packet from client',timestamp:$datetime}"                                 #show on console
done
