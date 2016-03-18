# Makefile for Auto Deploy
C = gcc
CFLAGS = -g -c `pkg-config --cflags libevent` `pkg-config --cflags hiredis`
LDFLAGS = -lm -lpthread `pkg-config --libs libevent` `pkg-config --libs hiredis`

all: main.c
	$(CC) -o daemonize.o daemonize.c $(CFLAGS)
	$(CC) -o worker.o worker.c $(CFLAGS)
	$(CC) -o redis.o redis.c $(CFLAGS)
	$(CC) -o cJSON.o cJSON.c $(CFLAGS)
	$(CC) -o process.o process.c $(CFLAGS)
	$(CC) -o main.o main.c $(CFLAGS)
	$(CC) -o deploy main.o daemonize.o worker.o redis.o cJSON.o process.o $(LDFLAGS)

clean:
	rm -rf *.o
	rm -rf deploy
