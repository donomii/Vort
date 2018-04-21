# VORT

Vort is a network filesystem, perfect for home and small office environments.

## Features

Vort is quick, simple, and easy to setup and use.

## Setup

Download [vort](release path here).  Double click to install, 

## Use

### Server

From the windows start menu, select "Vort-nfs", the Vort Network File server.  Vort server will start, and print out a url for contacting the server.  Use this url with the client, as descirbed below.

### Client

To connect to the server, open a command shell in the vort directory, and use the vort windows client, with the url from the server:

    vort-winfs.exe z:\ http://192.168.1.101/

There will be a GUI for this soon.

Vort-winfs requires the Dokany driver, included with the installer.  If you do not have admin permission on your windows machine, you will not be able to install Dokany, and instead will have to use vort-ftprelay, which is an alternative way to access your files under windows.  It is less convenient, but it doesn't require Administrator permission.

    vort-relay.exe --repo=http://192.168.1.101/ --type=http

On Linux, you will have to use vort-relay.  A fuse version is being planned.


