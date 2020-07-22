#
#   Simple Gnuplot Template for easy visualization
#   
#   Note: This script uses Windows Fonts!
#   Diogo Ribeiro 16/06/20

reset
#..... Terminals .....
set terminal pngcairo enhanced font "Bahnschrift SemiLight,12" fontscale 1.0 size 1000,700 background rgb 'white'
set output "simple_plot_template_2.png"

#..... Styles .....
load 'turbo.pal'
set key Right box  width 1.6 height 1.2
set samples 1000
set grid


#..... Labels and Titles .....
set xlabel "x"
set ylabel "y"

#..... Ranges ..... 
set xrange[0:30]
set yrange[-0.5:1.4]

#..... Functions .....
f(v,T) = 4/sqrt(pi*T**3)*exp(-v**2/T)*v**2
g(x)   = sin(x)/x

#..... Ploting  .....
plot    g(x) w l ls 7 lw 3 dashtype 4 title "f(x)",\
        g(x-30) w l ls 2 lw 3 title "g(x)" , \
        0.8- g(x-15)/sqrt(abs(x-15)) w l ls 3 lw 3 title "h(x)" 
        
#..... Reset .....
set output
reset
