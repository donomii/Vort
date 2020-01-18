echo Starting complete vort build.
apt install libxcursor-dev libx11-dev libxinerama-dev libglfw3-dev libxinerama1 libxi-dev
sudo apt install libxcursor-dev libx11-dev libxinerama-dev libglfw3-dev libxinerama1 libxi-dev
mkdir build
cd build
rm vort-fuse
rm vortcmd
rm vort-launcher
rm vort-nfs
rm vort-pserver
rm vort-ftprelay
export GIT_TERMINAL_PROMPT=1
set -x GIT_TERMINAL_PROMPT 1
go clean
for /f %%i in ('date /T') do set BT="%%i"
set COMM="Development_build"
set CPATH=C:\Program Files (x86)\WinFsp\inc\fuse
go build -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" github.com/donomii/hashare/vortcmd
go build -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" github.com/donomii/vort-fuse
go build -gcflags "-l -N" -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" github.com/donomii/vort-launcher
go build -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" github.com/donomii/vort-synchronise
go build -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" github.com/donomii/vort-nfs
go build -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" github.com/donomii/vort-pserver
go build -ldflags "-X main.buildTime=%BT% -X main.commitHash=%COMM%" -o vort-ftprelay github.com/donomii/vort-ftprelay/vort/
