# FastCGIServer
Lighttpd running on Docker to serve FastCGI scripts

# Requirements

For running the Docker container:
- Linux
- Docker with admin privileges (if not, you have to do `sudo` on every Docker command)
- amd64 CPU (for the Docker image)

For developing FastCGI scripts:
- a C compiler
- FastCGI headers (to install those on Ubuntu, run `sudo apt install libfcgi-dev`)
- scripts compiled with the same `glibc` version as the Debian Docker image
  - shouldn't be a problem on Ubuntu

# How to use

1. write your FastCGI scripts in C
2. compile the `*.c` files with `-static` and `-lfcgi` flags if you're using GCC
3. clone this repository and put the compiled files into the `app` subdirectory of this repo
4. edit `config/lighttpd.conf` to set up the URL endpoints for your scripts. It's at the bottom of the conf file.
5. execute `make run` to start the server
6. visit `http://localhost:80` with your web browser or run `curl http://localhost:80` to see the script's output. The URL depends on how you set up the endpoints in step 4.
7. type `Ctrl + C` on the terminal to shut the server down.

# Author, Licence

This work by Alan Tseng in 2023 is licenced under Creative Commons Zero (CC0).
