. sharness/sharness.sh

SHARNESS_TEST_EXTENSION="bash"

export GEM_PATH=$GEM_PATH:/home/alberto/.gem/ruby/2.2.0

if test "$COVERAGE" = "yes"
then
    COMMAND="$COV_PROGRAM ../../bash-ini-parser"
else
    . ../../bash-ini-parser
    COMMAND=""
fi

export COMMAND

DIR_TEST=$SHARNESS_TEST_DIRECTORY/${0%%-*}
