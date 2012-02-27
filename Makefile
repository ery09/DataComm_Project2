CC = g++
CFLAGS= -O3 
LIBS = -lpthread\

all:  server client
clean:
	rm -f *.o
	rm -f server client

sha.o   : sha.h sha.c
	  $(CC) $(CFLAGS) -c sha.c

common.o: common.cpp common.h sha.h   
	  $(CC) $(CFLAGS) -c common.cpp

server.o: server.cpp common.h server.h sha.h
	  $(CC) $(CFLAGS) -c server.cpp 

server:  server.o common.o sha.o
	  $(CC) $(CFLAGS) -o server server.o common.o sha.o 

client.o: client.cpp common.h client.h sha.h
	  $(CC) $(CFLAGS) -c client.cpp 

client:  client.o common.o sha.o
	  $(CC) $(CFLAGS) -o client client.o common.o sha.o ${LIBS}

