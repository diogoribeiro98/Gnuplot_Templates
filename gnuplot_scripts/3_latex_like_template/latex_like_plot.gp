#
#   Simple Latex like Gnuplot Template 
#   
#   Diogo Ribeiro 22/07/20

reset
#..... Terminals .....
set term pdf enhanced font "LM Roman 10,11" size 8 cm, 9.5 cm
set output "latex_like_plot.pdf"

#...... Data Treatment .....
set decimalsign ','

f1(x) = a1*x
f2(x) = 1.23*x

fit f1(x) "data/even_even.txt" u 1:2 via a1

#..... Multiplot .....
set multiplot

#..... Top Plot .....
set size 1,0.7
set key box vertical width 1.5 height 0.2 maxcols 1  bottom
set grid
set origin 0.0,0.3

set tmargin 0.2
set bmargin 0.5
set rmargin 0.2
set lmargin 6.7

set xtics ( "" 5  ,  "" 5.5 , "" 6 , "" 6.5, "" 7 )
set ytics ( "6.0" 6.0 ,"6.5" 6.5  ,  "7.0" 7.0, "7.5" 7.5 , "8.0" 8.0 , "8.5" 8.5 , "9.0" 9.0)

unset xlabel
set ylabel "a(fm)" offset 0

set xrange[4.7:7.5]
set yrange[5.6:9.2]

set label 1 "a = 1.23 A^{1/3}" at 6.7,8.0 rotate by 43
set label 2 sprintf("a = %.2f A^{1/3}",a1) textcolor rgb 'red' at 6.5,8.25 rotate by 43 

plot  "data/even_even.txt"    u 1:2 w p ps 0.2 pt 7 lc rgb "red" title  "EE" ,\
      "data/even_odd.txt"     u 1:2 w p ps 0.2 pt 7 lc rgb "blue" title  "EO" ,\
      "data/odd_even.txt"     u 1:2 w p ps 0.2 pt 7 lc rgb "orange" title  "EE" ,\
      "data/odd_odd.txt"      u 1:2 w p ps 0.2 pt 7 lc rgb "black" title  "OO",\
      f1(x)                   lc rgb 'red' lw 1.5  dashtype 1 notitle,\
      f2(x)                   lc rgb 'black' lw 1.5  dashtype 2 notitle


#..... Bottom Plot .....
set size 1,0.3
unset key
set grid
set origin 0.0,0.0

set tmargin 0
set bmargin 3
set rmargin 0.2
set lmargin 6.7

set xtics ( "" 5  ,  "" 5.5 , "" 6 , "" 6.5, "" 7 )
set ytics ( "-2" -2 , "" -1  ,  "0" 0 ,  "" 1 ,"2" 2)

set xlabel "A^{1/3}" 
set ylabel "err" offset 0

set xrange[4.7:7.5]
set yrange[-2:2]

unset label 1
unset label 2

plot  "data/even_even.txt"    u 1:($2-f1($1)) w p ps 0.2 pt 7 lc rgb "red" title  "Z = 90"  ,\
      "data/even_odd.txt"     u 1:($2-f1($1)) w p ps 0.2 pt 7 lc rgb "blue" title  "EO" ,\
      "data/odd_even.txt"     u 1:($2-f1($1)) w p ps 0.2 pt 7 lc rgb "orange" title  "EE" ,\
      0 notitle lc -1
      
#..... Reset .....
unset multiplot
set output
reset
