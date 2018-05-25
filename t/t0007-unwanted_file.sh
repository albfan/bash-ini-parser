#!/bin/bash

test_description="check unwanted file"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0007

test_expect_success "Unwanted file" "
    export COVERAGE_NAME=file_2_parser
    cp ../.simplecov .
    cfg_parser $DIR_TEST/file_2.ini
    cfg_section_sec1
    var1=bar
    cfg_update sec1 var1
    cfg_writer > file_2.out
    test ! -e 2
"

test_done
