BEGIN  {
 seqno=-1;
 dp = 0;
 rp = 0;
 count = 0;
}
{
if($4=="AGT" && $1=="s" && seqno<$6)
{
 seqno=$6;
}
else if($4=="AGT" && $1=="r")
{
rp++;
}
else if($1=="d" && $7=="tcp")
{
dp++;
}

if($4=="AGT" && $1=="s")
{
 start_time[$6]=$2;
}
else if($4=="AGT" && $1=="r")
{
 end_time[$6]=$2;
}
else if($1=="d" && $7=="tcp")
{
 end_time=-1;
}
}

END {
for(i=0;i<=seqno;i++)
{
if(end_time[i]>0)
{
 delay[i]=end_time[i]-start_time[i];
 count++;
}
else
{
delay[i]=-1;
}
}
for(i=0;i<=seqno;i++)
{
if(delay[i]>0)
{
ssdelay=ssdelay+delay[i];
}
}
ssdelay=ssdelay/(count+1);
print "generated packets="seqno+1;
print "received packets="rp;
print "dropped packets="dp;
print "\n";
printf("average ssdelay=%.2f",ssdelay*1000);
print "\n";
}
