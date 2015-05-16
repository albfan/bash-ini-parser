#!/bin/sh

SHARNESS_TEST_EXTENSION="sh"

test_description="check parse"

. sharness/sharness.sh

. ../../bash-ini-parser

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0001

test_expect_success "Whitespace parse" "
    cfg_parser $DIR_TEST/whitespace.ini &&
    cfg_writer > whitespace.out &&
    diff -u whitespace.out $DIR_TEST/whitespace.out.correct
"

test_done
