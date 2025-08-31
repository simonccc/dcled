# This file is part of dcled, written on Sun Jan  4 00:18:16 PST 2009
# Jeff Jahr <malakai@jeffrika.com> -jsj 

# INSTALLDIR is where the binaries get installed
INSTALLDIR=/usr/local/bin
DCLEDVERSION="2.2"
DIST=dcled-$(DCLEDVERSION)
LIBUSB_CFLAGS=-I/usr/include/libusb-1.0
LIBUSB_LIBS=-lusb-1.0

# If gcc isnt your compiler, change it here.
 
CC=gcc

CFLAGS= -g -O3 -Wunused-variable -DDCLEDVERSION='$(DCLEDVERSION)' ${LIBUSB_CFLAGS}
LDFLAGS= -g -lm ${LIBUSB_LIBS}
 
# You probaby dont need to change anything below this line...
 
# List of the various files
CFILES= dcled.c
OFILES= dcled.o 

# build everything
all:	dcled 

dcled: dcled.o
	$(CC) dcled.o -o dcled $(LDFLAGS)

# rebuild the ctags
ctags: $(CFILES)
	ctags -d -I -l c -t $(CFILES)

# remove the object files
clean:	
	rm $(OFILES) dcled

# copy stuff into the install directory
install:
	mkdir -p $(INSTALLDIR)
	cp dcled $(INSTALLDIR)

# ...and now the dependencies. 
dcled.o : dcled.c
	$(CC) -c $(CFLAGS) dcled.c
