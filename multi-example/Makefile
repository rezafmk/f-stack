TOPDIR=..

ifeq ($(FF_PATH),)
	FF_PATH=${TOPDIR}
endif

ifneq ($(shell pkg-config --exists libdpdk && echo 0),0)
$(error "No installation of DPDK found, maybe you should export environment variable `PKG_CONFIG_PATH`")
endif

PKGCONF ?= pkg-config

CFLAGS += -O3

LIBS+=-ldl

TARGET="helloworld2"
all:
	cc ${CFLAGS} -DINET6 -o ${TARGET} main.c ${LIBS}

.PHONY: clean
clean:
	rm -f *.o ${TARGET} ${TARGET}_epoll
