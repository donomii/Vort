# VORT

Vort is a network filesystem, perfect for home and small office environments.

## Features

Vort is quick, simple, and easy to setup and use.

## Setup

Download [vort](release path here).  Double click to install, then from the windows start menu, select "Vort-nfs", the Vort Network File server.

## Use

To connect to the server, open a command shell in the vort directory, and use the windows mount program:

    vort-winfs.exe z:\ http://192.168.1.101/

There will be a GUI soon.

Vort-winfs requires the dokany driver, included with the installer.  If you do not have admin permission on your windows machine, you will have to use vort-ftprelay, which is an alternative way to access your files under windows.  It is slower and less reliable, but it doesn't require Administrator permission.

    vort-relay.exe --repo=http://192.168.1.101/ --type=http

On Linux, you will have to use vort-relay.  A fuse version is being planned.


