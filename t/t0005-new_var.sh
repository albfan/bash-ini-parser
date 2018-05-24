#!/bin/bash

test_description="create new var"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0005

test_expect_success "Parse new var" "
    export COVERAGE_NAME=new_var_parser
    cp ../.simplecov .
    cfg_parser $DIR_TEST/var.ini
    cfg_section_sec1
    var2=bar
    cfg_update sec1 var2
    cfg_writer > var.out
    diff $DIR_TEST/var.out.correct var.out
"

test_done
