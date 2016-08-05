BEGIN {
 recvsize=0;
 starttime=500;
 stoptime=0;
}
{
event=$1;
time=$2;
node_id=$3;
pkt_size=$8;
level=$4;
if(level=="AGT" && event=="s")
{
if(time<starttime)
{
starttime=time;
}
}
if(level=="AGT" && event=="r")
{
if(time>stoptime)
{
stoptime=time;
}
}
hdr_size=pkt_size%512;
pkt_size-=hdr_size;
recvsize+=pkt_size;
}

END {
printf("start time=%.2f",starttime);
printf("stoptime=%2f",stoptime);
printf("average throughput=%.2f",(recvsize/(stoptime-starttime))*(8/1000));
}
