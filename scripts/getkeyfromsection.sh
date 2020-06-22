#!/bin/bash

if [ "$#" -ne 3 ]
then
  echo provide three parameters
  echo "$0 <ini.file> <section> <value>"
  exit 1
fi

source $(dirname $0)/../bash-ini-parser

TEST_FILE="$1"
TEST_SECTION="$2"
TEST_VALUE="$3"

# parse the config file
cfg_parser "$TEST_FILE"

# show parsed ini file
echo show parsed $TEST_FILE
cfg_writer
echo

# enable section selected
cfg_section_$TEST_SECTION

# show value of section selected
echo "$TEST_VALUE value is \"${!TEST_VALUE}\""

