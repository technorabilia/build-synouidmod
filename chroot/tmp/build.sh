#!/bin/bash

source /tmp/platform.env

if [ -z $CC64 ]
then
  CC=$CC32
  ToolChainLib=$ToolChainLib32
else
  CC=$CC64
  ToolChainLib=$ToolChainLib64
fi

$CC -DNO_PROTO -L$ToolChainLib \
  -lsynosdk /tmp/synouidmod.c -o /tmp/synouidmod
