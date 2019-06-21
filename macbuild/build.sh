rm vort-fuse
rm vort-launcher
rm vort-nfs
rm vort-pserver
rm vort-ftprelay
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

cp vort-fuse vort-nfs vort-launcher vort-pserver vort-ftprelay Vort.app/Contents/MacOS/
hdiutil create -volname Vort -srcfolder Vort.app/ -fs HFS+ -ov -format UDSB  -size 100m Vort_dist.dmg
mv Vort_dist.dmg.sparsebundle Vort_dist.dmg

mkdir mountpoint
hdiutil attach Vort_dist.dmg -mountpoint  mountpoint
cd mountpoint
ln -s ~/Applications
cd ..
hdiutil detach mountpoint
rm Vort.dmg
hdiutil convert Vort_dist.dmg  -format UDZO -o Vort.dmg
rm -r Vort_dist.dmg
rmdir mountpoint
