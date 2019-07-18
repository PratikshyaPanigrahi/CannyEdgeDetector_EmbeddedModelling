# Makefile: Canny Edge Detector model in SystemC

# --- settings ---

VIDEO	= EngPlaza
FRAMES	= $(VIDEO)[0-9][0-9][0-9]_edges.pgm

SYSTEMC_HOME = /opt/pkg/systemc-2.3.1

CC	= g++
CCOPT	= -g -Wall -O2 

# --- targets ---

all:	Canny

test:	Canny
	./Canny
	
		for f in video/$(FRAMES); do \
		./ImageDiff `basename $$f` $$f; \
		done

clean:
	rm -f *~ *.bak *.BAK
	rm -f *.o
	rm -f Canny
	rm -f $(FRAMES)

# --- compile the example ---

Canny: Canny.cpp
	$(CC) $(CCOPT) $< \
		-I$(SYSTEMC_HOME)/include \
		-L$(SYSTEMC_HOME)/lib-linux64 \
		-Xlinker -R -Xlinker $(SYSTEMC_HOME)/lib-linux64 \
		-lsystemc -o $@

# EOF

