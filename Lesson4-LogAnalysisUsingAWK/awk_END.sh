# END runs after the file has been processed.
# This counts the total number of lines in the log file.
awk '{count++} END {print "Total lines:", count}' awk1.log