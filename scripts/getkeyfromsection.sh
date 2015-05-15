#!/bin/bash

source ../bash-ini-parser

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

