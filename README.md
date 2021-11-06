# apps-and-sofwares
This repository constains all the finished and polished projects that can be classified as softwares or apps (including homebrews and hacks)

Inside the software directory can be found unix systems apps and softwares such as ssh clients.
Unix-like projects are marked with the unix prefix inside their name.
In opposite, windows apps will have win as prefix.
Homebrews apps are hack that run on custom firmware.
those homebrews, like softwares, have their target machine in the starting of their name.
for example: 3ds-ssh2-cli is a ssh client made using libssh2, that targets the 3ds (and 2ds, OLD/NEW models) systems.
The following parts of this readme is dedicaced to all the sofwares apps and homebrew projects contained in this apps-and-software repository:

------------------------------------------------------------------------------------------------

Unix-ssh2-cli:

This software is a basic ssh client made with the libssh2 library (depending on openssh).
In order to compile it, you must specify the ssh2 library like so:
```
gcc -o <target output> main.c -lssh2
```
In order to use it, you have to enter the host address, username and password when launching the app.
For example:
```
./a.out 192.168.0.0 username password
```
Otherwise, the sofware will notify you to do so.
Thanks to Ivan Tretyakov for their work on the SmallSimpleSSH.c project, which helped me designing this one and understanding
the libssh2 library. The link to their project can be found below:

Link: https://www.libssh2.org/mail/libssh2-devel-archive-2018-10/att-0013/SmallSimpleSSH_2.c

------------------------------------------------------------------------------------------------

Instructions-runners: (file/argv/input)

Thoses softwares are simple machine-code / opcodes executers wrote in NASM or GAS.
Compiled versions can be found in the "build" branch of the repository.
Compile instructions and run parameters can be found the the Makefiles.
Made for linux i386.
