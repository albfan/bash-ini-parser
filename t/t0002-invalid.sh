#!/bin/bash

test_description="check invalid ini files"

. setup.sh

test_expect_success "Invalid line" "
    export COVERAGE_NAME=invalid_line
    cp ../.simplecov .
    test_expect_code 2 $COMMAND cfg_parser $DIR_TEST/invalid.ini
"

test_done
