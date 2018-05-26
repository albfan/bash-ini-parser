#!/bin/bash

test_description="check duplication"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0006

test_expect_success "Remove duplication" "
    export COVERAGE_NAME=duplication_parser
    cp ../.simplecov .
    cfg_parser $DIR_TEST/duplication.ini
    export COVERAGE_NAME=duplication_section
    cfg_section_sec1
    var1=bar
    export COVERAGE_NAME=duplication_update
    cfg_update sec1 var1
    export COVERAGE_NAME=duplication_writer
    cfg_writer > duplication.out
    test_cmp $DIR_TEST/duplication.out.correct duplication.out
"

test_done
