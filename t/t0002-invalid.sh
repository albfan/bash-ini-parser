#!/bin/sh

SHARNESS_TEST_EXTENSION="sh"

test_description="check invalid ini files"

. sharness/sharness.sh

. ../../bash-ini-parser

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0002

test_expect_success "Invalid line" "
    test_expect_code 1 cfg_parser $DIR_TEST/invalid.ini
"

test_done
