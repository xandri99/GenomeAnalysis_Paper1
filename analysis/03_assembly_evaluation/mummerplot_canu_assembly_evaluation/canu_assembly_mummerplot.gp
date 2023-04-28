set terminal png tiny size 800,800
set output "/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/03_assembly_evaluation/mummerplot_canu_assembly_evaluation/canu_assembly_mummerplot.png"
set xtics rotate ( \
 "" 0 \
)
set ytics ( \
 "tig00000001" 1, \
 "tig00000002" 2763567, \
 "tig00000003" 2979567, \
 "tig00000004" 3008440, \
 "tig00000005" 3023174, \
 "tig00000006" 3063187, \
 "tig00000007" 3078202, \
 "tig00000008" 3094246, \
 "tig00000009" 3119082, \
 "" 3135573 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set mouse clipboardformat "[%.0f, %.0f]"
set xrange [1:*]
set yrange [1:3135573]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/03_assembly_evaluation/mummerplot_canu_assembly_evaluation/canu_assembly_mummerplot.fplot" title "FWD" w lp ls 1, \
 "/domus/h1/xandri/GenomeAnalysis_Paper1/analysis/03_assembly_evaluation/mummerplot_canu_assembly_evaluation/canu_assembly_mummerplot.rplot" title "REV" w lp ls 2
