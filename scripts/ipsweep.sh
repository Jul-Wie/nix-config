 #/bin/bash

for ip in `seq 113 254`; do
ping 192.168.56.$ip -c 1 &
done
