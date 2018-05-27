#!/bin/bash

test_description="check executable"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0009

test_exec()
{
export COVERAGE_NAME=exec_parser
cp ../.simplecov .

cfg_parser $DIR_TEST/exec.ini
cfg_section_sec1
[ "$var1" != "hack" ] || return 1
[ "$var2" != "hack" ] || return 1
}

test_expect_success "Parse executable" "
    test_expect_code 0 test_exec
"

test_done
