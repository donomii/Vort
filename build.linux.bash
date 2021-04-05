echo Starting complete vort build.
apt install libxcursor-dev libx11-dev libxinerama-dev libglfw3-dev libxinerama1 libxi-dev
sudo apt install libxcursor-dev libx11-dev libxinerama-dev libglfw3-dev libxinerama1 libxi-dev
mkdir build
cd build
rm vort-fuse vort-launcher vort-nfs vort-pclient vort-pserver vort-ftprelay vort-webrelay vort-synchronise
export GIT_TERMINAL_PROMPT=1
export GO111MODULE=off
set -x GIT_TERMINAL_PROMPT 1
export go="go1.13.8"
go clean
export BT=`date "+%Y-%m-%d%H:%M:%S"`
export COMM=`git rev-parse HEAD`
go get -u github.com/donomii/vort-fuse github.com/donomii/vort-webrelay github.com/donomii/vort-launcher github.com/donomii/vort-nfs github.com/donomii/vort-pserver github.com/donomii/vort-ftprelay github.com/donomii/vort-synchronise
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM" -a github.com/donomii/vort-fuse 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM  -X main.pclient=true" -a -o vort-pclient github.com/donomii/vort-fuse 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM  -X main.pclient=true" -a -o vort-webrelay github.com/donomii/vort-webrelay
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM"  github.com/donomii/vort-launcher 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM"  github.com/donomii/vort-nfs 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM"  github.com/donomii/vort-pserver 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM"  -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/ 
go build -a -ldflags "-X main.buildTime=$BT -X main.commitHash=$COMM"  github.com/donomii/vort-synchronise 
wait
