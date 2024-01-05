.PHONY: all
all: speexclient

CFLAGS:=-g -Wall
SPEEXDSP_LIBS:=$(shell pkg-config --libs speexdsp)
SPEEX_LIBS:=$(shell pkg-config --libs speex)
LDLIBS:=$(SPEEX_LIBS) $(SPEEXDSP_LIBS) -lasound -lm

speexclient: speexclient.o speex_jitter_buffer.o alsa_device.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

.PHONY: clean
clean:
	rm -f *.o *~ speexclient
