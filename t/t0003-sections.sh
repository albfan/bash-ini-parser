#!/bin/sh

SHARNESS_TEST_EXTENSION="sh"

test_description="check sections"

. sharness/sharness.sh

. ../../bash-ini-parser

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0003

test_expect_success "Parse sections" "
    cfg_parser $DIR_TEST/sections.ini
    cfg_writer > sections.out
    diff $DIR_TEST/sections.out.correct sections.out
"

test_done
