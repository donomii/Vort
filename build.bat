echo Starting complete vort build.
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
set CPATH="C:\Program Files (x86)\WinFsp\inc\fuse"
#go get -u github.com/donomii/vort-fuse
go build -a github.com/donomii/vort-fuse
#go get -u github.com/donomii/vort-launcher
go build -a github.com/donomii/vort-launcher
#go get -u github.com/donomii/vort-nfs
go build -a github.com/donomii/vort-nfs
#go get -u github.com/donomii/vort-pserver
go build -a github.com/donomii/vort-pserver
#go get -u github.com/donomii/vort-ftprelay
go build -a -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/
