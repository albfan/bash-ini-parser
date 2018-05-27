#!/bin/bash

test_description="check array"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0008

export COVERAGE_NAME=array_parser
cp ../.simplecov .
# Parse sec1 array
cfg_parser $DIR_TEST/array.ini
cfg_section_sec1

test_expect_success "var1 is foo" "
  test $var1 = foo
"

test_expect_success "var1[1] is bar" "
  test ${var1[1]} = bar
"

# Update sec2 var
var2=foo_new
cfg_update sec2 var2
cfg_writer > array.out
  
# Parse sec1 array again
cfg_parser array.out
cfg_section_sec1

test_expect_success "var1 is foo" "
  test $var1 = foo
"

test_expect_success "var1[1] is bar" "
  test ${var1[1]} = bar
"

test_done
