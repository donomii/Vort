echo Starting complete vort build.
mkdir build
export GIT_TERMINAL_PROMPT=1
set -x GIT_TERMINAL_PROMPT 1
set CPATH=C:\Program Files (x86)\WinFsp\inc\fuse
go get -u github.com/donomii/vort-fuse
go build github.com/donomii/vort-fuse
go get -u github.com/donomii/vort-launcher
go build github.com/donomii/vort-launcher
go get -u github.com/donomii/vort-nfs
go build github.com/donomii/vort-nfs
go get -u github.com/donomii/vort-pserver
go build github.com/donomii/vort-pserver
go get -u github.com/donomii/vort-ftprelay
go build -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/


