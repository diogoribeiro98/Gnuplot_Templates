#
#   Simple Gnuplot Template for easy visualization
#   
#   Note: This script uses Windows Fonts!
#   Diogo Ribeiro 16/06/20

reset
#..... Terminals .....
set terminal pngcairo enhanced font "Bahnschrift SemiLight,12" fontscale 1.0 size 1000,700 background rgb 'white'
set output "simple_plot_template.png"

#..... Styles .....
set style fill transparent solid 0.5
set key 
set samples 1000
set grid

#..... Labels and Titles .....
set title "MAXWELL SPEED DISTRIBUITION"
set xlabel "Speed [(2kT_c/m)^{1/2}]"
set ylabel "Probability Intensity f(v)"
set label "This is a label with an arrow" at 1.5,1.5
set arrow from  1.48,1.52 to 1,0.9 filled lc -1

#..... Ranges ..... 
set xrange[0:5]
set yrange[0:3]

#..... Functions .....
f(v,T)=4/sqrt(pi*T**3)*exp(-v**2/T)*v**2

#..... Ploting  .....
plot    f(x,0.1) w filledcurves x1 title "T=0.1T_c",\
        f(x,1)   w filledcurves x1 title "T=T_c",\
        f(x,5)   w filledcurves x1 title "T=5T_c"

#..... Reset .....
set output
reset
