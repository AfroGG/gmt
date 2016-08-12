#!/bin/bash
ps=wrapper.ps
cat << EOF > bad1.txt
90	0
200	0
240	0
285	0
300	0
300	-40
285	-40
240	-40
200	-40
90	-40
90	0
EOF
cat << EOF > bad2.txt
90	20
130	20
130	50
90	50
90	20
EOF
gmt psxy -R-80/120/-60/60 -JM6i -Glightred -P -Baf -K bad1.txt -A > $ps
gmt psxy -R -J -Glightblue -O -K bad2.txt -A >> $ps
gmt psxy -R -J -O -W0.25p bad1.txt bad2.txt -A >> $ps
gv $ps &
