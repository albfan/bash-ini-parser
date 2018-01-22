#!/bin/sh

SHARNESS_TEST_EXTENSION="sh"

test_description="check comments"

. sharness/sharness.sh

. ../../bash-ini-parser

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0004

test_expect_success "Parse sections" "
    cfg_parser $DIR_TEST/comments.ini
    cfg_writer > comments.out
    diff $DIR_TEST/comments.out.correct comments.out
"

test_done
