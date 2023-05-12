.dummy: all build run clean

# Current directory
DIR := ${CURDIR}

all: home/hello_app.fcgi

home/hello_app.fcgi:
	# To compile a FastCGI script, use -lfcgi and do static linking just in case
	$(CC) -static src/hello_fastcgi.c -o home/hello_app.fcgi -lfcgi -O3 -Wall -Wextra -pedantic -std=c11

run:
	# Mount local directories into the container and run the container
	docker run -it -v ${DIR}/config:/etc/lighttpd -v ${DIR}/home:/var/www/localhost/ -p 80:80 agentlans/lighttpd-fastcgi

build:
	# For development (only I can successfully run this)
	docker build . -t agentlans/lighttpd-fastcgi
	docker push agentlans/lighttpd-fastcgi

clean:
	# Remove the compiled file
	rm -f home/hello_app.fcgi
