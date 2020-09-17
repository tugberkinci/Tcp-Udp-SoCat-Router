socat -T 1 UDP4-LISTEN:10001,fork - |  #listen udp port of 10001
while read -r packet
do
	echo "UDP4-->[$packet]"
	echo "UDP4-->:[$packet]$(date +"%T")" >> udplog.txt  #write on udplog.txt with insert date
done
