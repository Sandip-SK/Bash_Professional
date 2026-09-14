#print 1st column
awk '{print $1}' awk1.log

#print multiple columns
awk '{print $1, $2, $3}' awk1.log

#print all columns
awk '{print $0}' awk1.log