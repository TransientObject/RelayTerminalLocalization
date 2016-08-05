set title 'Number of sensor nodes vs Throughput'
set grid
set xlabel 'Number of sensor nodes'
set ylabel 'Throughput(Mbps)'
plot "graph2" u ($1):($2) t "Existing" w lp,"graph2" u ($1):($3) t "Proposed" w lp
pause -1
