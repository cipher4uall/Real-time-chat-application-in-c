CC ?= cc
CFLAGS ?= -Wall -Wextra -Werror -O2 -pthread
CPPFLAGS ?=
LDFLAGS ?=
LDLIBS ?=

SERVER_BIN := server
CLIENT_BIN := client

SERVER_OBJS := server.o helper.o
CLIENT_OBJS := client.o helper.o

.PHONY: all clean

all: $(SERVER_BIN) $(CLIENT_BIN)

$(SERVER_BIN): $(SERVER_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(CLIENT_BIN): $(CLIENT_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c helper.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	rm -f $(SERVER_BIN) $(CLIENT_BIN) *.o
