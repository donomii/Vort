del *.exe
del *.exe~
set CPATH=C:\Program Files (x86)\WinFsp\inc\fuse
go build ..\
"c:\Program Files (x86)\Inno Script Studio\ISStudio.exe" -compile vort-pserver.iss
