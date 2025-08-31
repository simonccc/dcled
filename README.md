# dcled 
*Copyright 2009-2014 Jeff Jahr <malakai@jeffrika.com>*

dcled is a utiliy to operate a USB message board / ticker type device. 

This is a cut down version of the original code with maybe some refinements in the future. 

Please check the [docs] for the original info 

## BUILDING IT:

If you are running
debian or ubuntu, try running 'apt-get install libusb-1.0-0-dev' to get the
right files installed.

Type 'make'.  That should build an executable called 'dcled'.  If that doesnt
work, try compling it by hand.  There is an install option in the makefile.  If
the first make command was successful, run 'make install' as root to copy the
executable into /usr/local/bin.

## RUNNING IT:

You are going to need read/write access to the mesage board device in order to
use dcled.  This means you can either run dcled as root, suid the exe, or
figure out how to set the device permissions under hotplug if the method
suggested by the installation instructions didn't work for you.  

Usage- ./dcled [opts] [files]

        --brightness  -b   How bright, 0-2
        --clock       -c   Show the time
        --clock24h    -C   Show the 24h time
        --bcdclock    -B   Show the time in binary
        --debug       -d   Mostly useless
        --echo        -e   Send copy to stdout
        --help        -h   Show this message
        --message     -m   A single line message to scroll
        --nodev       -n   Don't use the device
        --preamble    -p   Send a graphic before the text.
        --repeat      -r   Keep scrolling forever
        --fastprint   -f   Jump to end of message.
        --speed       -s   General delay in ms
        --test        -t   Output a test pattern

Available preamble graphics:

         1 - dots       - A string of random dots
         2 - static     - Warms up like an old TV
         3 - squiggle   - A squiggly line
         4 - clock24    - Shows the 24 hour time
         5 - clock      - Shows the time
         6 - spiral     - Draws a spiral
         7 - fire       - A nice warm hearth
         8 - bcdclock   - Shows the time in binary


## EXAMPLES:

```
Run a test pattern:
dcled -t  

Hello World:
# dcled -m 'Hello World!'

Or via stdin 
#cecho 'Hello World!' | dcled


run a clock
# dcled --clock --repeat

preambles 
# dcled -p static -m "Hello World"
# dcled -p 2 -m "Hello World"

Here is how I use it to monitor my game server syslog file:

# tail -f syslog | dcled -e -p static
```
## CREDITS:

Please see original README files in the docs directory
