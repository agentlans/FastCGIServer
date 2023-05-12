#include <fcgi_stdio.h>
#include <stdlib.h>

// Compile with: gcc hello_fastcgi.c -o hello_fastcgi.fcgi -lfcgi -O3 -Wall -Wextra -pedantic -std=c11

int main (void) {
    while (FCGI_Accept() >= 0) {
        printf("Status: 200 OK\r\n");
        printf("Content-type: text/html\r\n\r\n");
        printf("<!doctype><html><body>Hola mundo from fastcgi with lighttpd!</body></html>\n");
    }
    return EXIT_SUCCESS;
}
