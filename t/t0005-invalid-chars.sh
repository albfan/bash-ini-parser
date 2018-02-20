#!/bin/bash

test_description="replace invalid chars"

. setup.sh

DIR_TEST=$SHARNESS_TEST_DIRECTORY/t0005

#replace function
function replace_chars() { 
  if [[ $i =~ .*=.* ]]
  then
    local key=$(echo $1 | sed 's/\(.*\)=.*/\1/;s/-/_/g')
    local value=$(echo $1 | sed 's/.*=\(.*\)/\1/')
    echo "$key=$value"
  else
    echo $1
  fi
}
#export function to be avaliable on bash-ini-parser script
export -f replace_chars
#define var to use function inside bash-ini-parser
export REPLACE_FUNCTION=replace_chars

test_expect_success "Replace invalid chars" "
    export COVERAGE_NAME=comments_parser
    cp ../.simplecov .

    cfg_parser $DIR_TEST/invalid.ini
    cfg_writer > invalid.out
    diff $DIR_TEST/invalid.out.correct invalid.out
"

test_done
