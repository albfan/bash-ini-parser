#!/bin/bash

source ../bash-ini-parser

TEST_FILE="file.ini"
# parse the config file called 'myfile.ini'
cfg_parser "$TEST_FILE"

# show parsed ini file
echo show file parsed
cfg_writer
echo

echo show some results
# enable section called 'sec2' (in the file [sec2]) for reading
cfg.section.sec2

# read the content of the variable called 'var2' (in the file
# var2=XXX). If your var2 is an array, then you can use
# ${var[index]}
echo "var2 value is \"$var2\""
echo "var5[1] value is \"${var5[1]}"\"
echo "var5[*] value is \"${var5[*]}"\"
echo "var4 value is \"$var4"\"

