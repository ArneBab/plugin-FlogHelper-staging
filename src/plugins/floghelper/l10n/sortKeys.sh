#!/bin/sh

for x in *.l10n
do
	cat $x | grep -v "^End$" | sort | uniq > $x.sorted
	echo "End" >> $x.sorted
	rm -f $x
done

for x in *.l10n.sorted
do
	NEWFILENAME=`echo $x | sed -s "s/\.sorted$//"`
	mv $x $NEWFILENAME
done
