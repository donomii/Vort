echo Starting complete vort build.
apt install libxcursor-dev libx11-dev libxinerama-dev libglfw3-dev libxinerama1 libxi-dev
sudo apt install libxcursor-dev libx11-dev libxinerama-dev libglfw3-dev libxinerama1 libxi-dev
mkdir build
cd build
rm vort-fuse
rm vort-launcher
rm vort-nfs
rm vort-pserver
rm vort-ftprelay
export GIT_TERMINAL_PROMPT=1
set -x GIT_TERMINAL_PROMPT 1
go clean
export BT=`date "+%Y-%m-%d%H:%M:%S"`
export COMM=`git rev-parse HEAD`
go get -u github.com/donomii/vort-fuse
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -a github.com/donomii/vort-fuse 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM -X main.pclient=true" -a -o vort-pclient github.com/donomii/vort-fuse &
go get -u github.com/donomii/vort-launcher
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM"-a github.com/donomii/vort-launcher &
go get -u github.com/donomii/vort-nfs
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -a github.com/donomii/vort-nfs &
go get -u github.com/donomii/vort-pserver
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -a github.com/donomii/vort-pserver &
go get -u github.com/donomii/vort-ftprelay
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -a -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/ &
go get -u github.com/donomii/vort-synchronise
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -a github.com/donomii/vort-synchronise &
wait
