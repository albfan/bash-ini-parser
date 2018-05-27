#!/bin/bash

test_description="check executable"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0009

export COVERAGE_NAME=exec_parser
cp ../.simplecov .

cfg_parser $DIR_TEST/exec.ini
cfg_section_sec1

test_expect_success "var1 execute code" '
  test "$var1" != "hack"
'

test_expect_success "var2 execute code" '
 test "$var2" != "hack"
'

test_done
