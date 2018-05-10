count=1
while read line; do
cp SRC iptv_$count
name=`echo $line | cut -d "|" -f1`
ip=`echo $line | cut -d "|" -f2`
port=`echo $line | cut -d "|" -f3`
sed -i "s/239.1.1.115/${ip}/g" iptv_$count
sed -i "s/SLO 1/${name}/g" iptv_$count
sed -i "s/5000/${port}/g" iptv_$count
let count+=1
done < Tlist


count=1
chanalNum=1
while read line; do
cp CHSRC channels/$count
name=`echo $line | cut -d "|" -f1`
sed -i "s/SLO 2/${name}/g" channels/$count
sed -i "s/: 2/: ${chanalNum}/g" channels/$count
let chanalNum+=1
let count+=1
done < Tlist