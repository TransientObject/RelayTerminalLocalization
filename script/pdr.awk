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
}
END {
print "packet delivery ratio="rp/(seqno+1)*100"%";
print "total number of messages="(seqno+1)+rp+dp;
}

