BEGIN {
 initialenergy=90
 maxenergy=0
 n=30
 nodeid=999
}
{
17
event=$1
time=$2
if(event=="r" || event=="s" || event=="f") {
 node_id=$9
 energy=$17
}
if(event=="N") {
 node_id=$5
 energy=$7
}
finalenergy[node_id]=energy
}
END {
for(i in finalenergy) {
 consumeenergy[i]=initialenergy-finalenergy[i]
 totalenergy+=consumeenergy[i]
 if(maxenergy<consumeenergy[I]) {
  maxenergy=consumeenergy[i]
  nodeid=i
}
}
averageenergy=totalenergy/n
for(i=0;i<n;i++) {
print("node",i,consumeenergy[i])
}
print("============")
print("average",averageenergy)
print("============")
print("totalenergy",totalenergy)
print("============")
}
