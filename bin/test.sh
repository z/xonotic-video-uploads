#file="capture-10.23_-_2016-02-21_11-09_catharsis_2_188-101-134-222-14000-1.ogv"
#    	name=$(echo $file | sed 's/capture-//;
#                                s/[0-9-]*-\([0-9]*\)\.ogv/ - cap \1/;
#                                s/_\([0-9]*\)_\( - cap\)/ - player \1\2/;
#                                s/_/ /g;
#                                s/ \([0-9]\{2\}\)-\([0-9]\{2\}\)/ \1:\2 -/;')

echo $1 $2
sleep 2