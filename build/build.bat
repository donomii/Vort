echo Starting complete vort build.
go get github.com/donomii/vort-fuse
go build github.com/donomii/vort-fuse
go get github.com/donomii/vort-launcher
go build github.com/donomii/vort-launcher
go get github.com/donomii/vort-nfs
go build github.com/donomii/vort-nfs
go get github.com/donomii/vort-pserver
go build github.com/donomii/vort-pserver
go get github.com/donomii/vort-ftprelay
go build -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/


