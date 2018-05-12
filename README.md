# VORT

Vort is a network filesystem, perfect for home and small office environments.

It is a secure, encrypted file store, that works over the network, or on your local machine.

## Download

Warning:  this is experimental software.  Do not use it for anything important.  Make backups often!

[Windows](https://github.com/donomii/vort/releases/latest)

[Linux](https://github.com/donomii/vort/releases/latest)

[MacOSX](https://github.com/donomii/vort/releases/latest)

## Your own digital safety box

Keep your files securely on a USB key or in the cloud. 

Vort can encrypt your file box, guaranteeing your privacy even if you lose your usb key.  Vort protects your privacy, preventing your cloud host or government agency from reading your files.

## Features

* Undelete
* Compression
* Encryption
* Works well with sync programs like DropBox and CloudMe
* Windows, Linux and MacOSX

# Use

## Windows

After installing, right click on your desktop, select "New item...", then "Vort".  A new Vort file will appear.  Double click on this to open and use it.  If you don't see a normal file browser window within a few seconds, find the FTP url in the Vort window, and paste that into your web browser.

This file is a vort file store.  It is a portable file system, and works like a zip file, except it is easier to put files in, and take them out.

You can also serve this file to other people over the network, using vort-nfs.  This allows you to share network files without risk, since clients cannot escape the file store and access the rest of your computer.

## Components

Vort consists of several components:

[hashare](https://github.com/donomii/hashare), the core library

[vort-nfs](https://github.com/donomii/vort-nfs), the network server component

[vort-winfs](https://github.com/donomii/vort-winfs), the native windows filesystem mounter, relies on dokany

[vort-ftprelay](https://github.com/donomii/vort-ftprelay), a local ftp server that translates requests into the hashare protocol


## Use

### Server

From the windows start menu, select "Vort-nfs", the Vort Network File server.  Vort server will start, and print out a url for contacting the server.  Use this url with the client, as described below.

This will create an empty vort file store in the default location, if one doesn't exist already.  To serve a file from a different location, you will have to use the command line.

### Client

To connect to the server, open a command shell, and use the vort windows client with the url from the server:

    vort-winfs.exe z:\ http://192.168.1.101/

There will be a GUI for this soon.

Vort-winfs requires the Dokany driver, included with the installer.  If you do not have admin permission on your windows machine, you will not be able to install Dokany, and instead will have to use vort-ftprelay, which is an alternative way to access your files under windows.  It is less convenient, but it doesn't require Administrator permission.

    vort-relay.exe --repo=http://192.168.1.101/ --type=http

On Linux, you will have to use vort-relay.  A fuse version is being planned.


