socat TCP4-LISTEN:20002,fork - |    #listen tcp port of 20002
while read -r packet
do
	echo "TCP4-->[$packet]"
	echo "TCP4-->:[$packet]$(date +"%T")" >> tcplog.txt  #write on tcplog.txt with insert date
done
