
get_udp(){
	socat -T0.4 UDP4-LISTEN:5001,fork stdout |
	while read -r packet
	do
		datetime=$(date +"%T")                                  #datetime varable
		echo "ROUTER-->UDP4:[$packet]{$datetime}" >> route.txt  #write on route.txt with insert date
		echo "[$packet]" | socat - UDP4:localhost:10001         
		echo "UDP4-->[$packet]"                                 #show on console
	done
}
get_tcp(){
	socat tcp4-l:5001,fork - |
	while read -r packet
	do
		datetime=$(date +"%T")                                  #datetime varable
		echo "ROUTER-->TCP4[$packet]{$datetime}" >> route.txt   #write on route.txt with insert date
		echo "[$packet]"|socat - tcp4:localhost:20002           
		echo "TCP4-->[$packet]"                                 #show on console
	done
}
get_udp&get_tcp
