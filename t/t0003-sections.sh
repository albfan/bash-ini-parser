#!/bin/bash

test_description="check sections"

. setup.sh

test_expect_success "Parse sections" "
    export COVERAGE_NAME=sections_parser
    cp ../.simplecov .
    $COMMAND cfg_parser $DIR_TEST/sections.ini
    export COVERAGE_NAME=sections_writer
    $COMMAND cfg_writer > sections.out
    test_cmp $DIR_TEST/sections.out.correct sections.out
"

test_done
