#!/bin/bash

if [ ! -z "$OPTION_LIBS" ]; then
  IFS=, LIBS_LIST=("$OPTION_LIBS")

  for lib in ${LIBS_LIST[@]}; do
    cp -r $IGNITE_HOME/libs/optional/"$lib" \
        $IGNITE_HOME/libs/
  done
fi

if [ ! -z "$EXTERNAL_LIBS" ]; then
  IFS=, LIBS_LIST=("$EXTERNAL_LIBS")

  for lib in ${LIBS_LIST[@]}; do
    wget $lib -P $IGNITE_HOME/libs
  done
fi

QUIET=""

if [ "$IGNITE_QUIET" = "false" ]; then
  QUIET="-v"
fi

if [ -z $CONFIG_URI ]; then
  $IGNITE_HOME/bin/ignite.sh $QUIET
else
  $IGNITE_HOME/bin/ignite.sh $QUIET $CONFIG_URI
fi

LIBS_LIST=("$OPTION_LIBS")
for lib in ${LIBS_LIST[@]}; do echo $lib; done