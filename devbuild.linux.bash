#!/bin/bash
echo Starting complete vort build.
export go="go1.13.8"
mkdir build
cd build
rm vort-fuse
rm vortcmd
rm vort-launcher
rm vort-nfs
rm vort-pserver
rm vort-ftprelay
export GIT_TERMINAL_PROMPT=1
$go clean
export BT=`date "+%Y-%m-%d%H:%M:%S"`
export COMM=`git rev-parse HEAD`
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" github.com/donomii/vort-fuse
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM -X main.pclient=true" -o vort-pclient github.com/donomii/vort-fuse
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" github.com/donomii/hashare/vortcmd
$go build -gcflags "-l -N" -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" github.com/donomii/vort-launcher
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" github.com/donomii/vort-synchronise
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" github.com/donomii/vort-nfs
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" github.com/donomii/vort-pserver
$go build -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/
pkill -f vort-pserver
./vort-pserver &
echo Devbuild complete
