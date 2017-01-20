#!/bin/bash

#  Copyright (c) 2017, Princeton University.
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are
#  met:
#  * Redistributions of source code must retain the above copyright
#  notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#  copyright notice, this list of conditions and the following disclaimer
#  in the documentation and/or other materials provided with the
#  distribution.
#  * Neither the name of Princeton University nor the names of its
#  contributors may be used to endorse or promote products derived from
#  this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
#  CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
#  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
#  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
#  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#  POSSIBILITY OF SUCH DAMAGE.

## Runs or stops a CONIKS server instance

# Set all the configs here
# mvn builds our jar with dependencies
CLASS_DEST="../coniks_server/target/coniks_server-0.4.0.jar"
CLASSPATH="-cp $CLASS_DEST"
BENCH_BIN="org.coniks.coniks_server.UpdateHistoryTiming"
NUM_USERS=$1
TRIALS="10"
NUM_INSERTS="1000"
RUN_CONIKS="java $CLASSPATH $BENCH_BIN $NUM_USERS $TRIALS $NUM_INSERTS"

PROC=`cat /proc/cpuinfo | grep "model name" | cut -d " " -f 5 | head -1`
RAM=`cat /proc/meminfo | grep "MemTotal" | cut -d " " -f 9``cat /proc/meminfo | grep "MemTotal" | cut -d " " -f 10`

$RUN_CONIKS >> data/server_epoch\_$PROC\_$RAM.csv