# FastCGIServer
Lighttpd running on Docker to serve FastCGI scripts

# Requirements

For running the Docker container:
- Linux
- Docker with admin privileges (if not, you have to do `sudo` on every Docker command)
- a CPU compatible with the Docker image which is amd64

For developing FastCGI scripts:
- a C compiler
- FastCGI headers (to install those on Ubuntu, run `sudo apt install libfcgi-dev`)
- scripts compiled using the same `glibc` version as the Debian image
  - shouldn't be a problem on Ubuntu

# How to use

1. write your FastCGI scripts in C
2. compile the `*.c` files with `-static` and `-lfcgi` flags if you're using GCC
3. put the compiled files into the `home` subdirectory of this repo
   - you may need to create this directory yourself
4. edit `config/lighttpd.conf` to set up the URL endpoints for your scripts
5. execute `make run` to start the server
6. `curl http://localhost:80` or one of your endpoints to see the script's output
7. Type `Ctrl + C` on the terminal to shut the server down

# Author, Licence

This work by Alan Tseng in 2023 is licenced under Creative Commons Zero (CC0).
