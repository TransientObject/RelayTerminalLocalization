set title 'Number of nodes vs Data latency(%)'
set grid
set xlabel 'Number of nodes'
set ylabel 'Data latency(%)'
plot "graph3" u ($1):($2) t "Existing" w lp,"graph3" u ($1):($3) t "Proposed" w lp
pause -1
