set title 'Number of sensor nodes vs Network lifetime'
set grid
set xlabel 'Number of sensor nodes'
set ylabel 'Network lifetime'
plot "graph4" u ($1):($2) t "Existing" w lp,"graph4" u ($1):($3) t "Proposed" w lp
pause -1
