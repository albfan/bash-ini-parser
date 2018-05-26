#!/bin/bash

test_description="check parse"

. setup.sh

test_expect_success "Whitespace parse" "
    export COVERAGE_NAME=whitespace_parser 
    cp ../.simplecov .
    $COMMAND cfg_parser $DIR_TEST/whitespace.ini
    export COVERAGE_NAME=whitespace_writer 
    $COMMAND cfg_writer > whitespace.out
    test_cmp whitespace.out $DIR_TEST/whitespace.out.correct
"

test_done
