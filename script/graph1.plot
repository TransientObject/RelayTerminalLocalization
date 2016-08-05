set title 'Number of sensor nodes vs PDR'
set grid
set xlabel 'Number of sensor nodes'
set ylabel 'PDR'
plot "graph1" u ($1):($2) t "Existing" w lp,"graph1" u ($1):($3) t "Proposed" w lp
pause -1
