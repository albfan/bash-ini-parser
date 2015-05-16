#!/bin/sh

SHARNESS_TEST_EXTENSION="sh"

test_description="check parse"

. sharness/sharness.sh

. ../../bash-ini-parser

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0001

test_expect_success "Whitespace parse" "
    cfg_parser $DIR_TEST/test1.ini &&
    cfg_writer > test1.out &&
    diff -u test1.out $DIR_TEST/test1.out.correct
"

test_done
