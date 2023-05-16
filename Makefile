.dummy: all build run clean

# Current directory
DIR := ${CURDIR}

all: app/hello_app.fcgi

app/hello_app.fcgi:
	mkdir -p app # Directory of the compiled scripts
	# To compile a FastCGI script, use -lfcgi and do static linking just in case
	$(CC) -static src/hello_fastcgi.c -o app/hello_app.fcgi -lfcgi -O3 -Wall -Wextra -pedantic -std=c11

run:
	# Mount local directories into the container and run the container
	docker run -it -v ${DIR}/config:/etc/lighttpd -v ${DIR}/app:/var/www/localhost/ -p 80:80 agentlans/lighttpd-fastcgi

build:
	# For development (only I can successfully run this)
	docker build . -t agentlans/lighttpd-fastcgi
	docker push agentlans/lighttpd-fastcgi

clean:
	# Remove the compiled file
	rm -f app/hello_app.fcgi
