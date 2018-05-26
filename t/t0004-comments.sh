#!/bin/bash

test_description="check comments"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0004

test_expect_success "Parse comments" "
    export COVERAGE_NAME=comments_parser
    cp ../.simplecov .
    cfg_parser $DIR_TEST/comments.ini
    cfg_writer > comments.out
    test_cmp $DIR_TEST/comments.out.correct comments.out
"

test_done
