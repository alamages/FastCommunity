# Aaron Clauset
# Makefile  Oct2003
# feel free to hack this to pieces

#### local macros
# remove without fussing about it
RM = rm -f

# compiler name and flags
CCC = g++
CCFLAGS = -fomit-frame-pointer -funroll-loops -fforce-addr -fexpensive-optimizations

# loader flags
LDFLAGS = 

### local program information
EXEC=FastCommunityMH
SOURCES= fastcommunity_mh.cc

### intermediate objects
OBJECTS = $(SOURCES: .cc=.o)

### includes
INCLUDES = 

### headers
HEADERS = maxheap.h vektor.h

INSTALL_DIR = /usr/local/bin

### targets, dependencies and actions
$(EXEC): $(OBJECTS) Makefile
	$(LINK.cc) $(CCFLAGS) -o $(EXEC) $(OBJECTS)

### sort out dependencies
depend:
	makedepend $(INCLUDES) $(HEADERS) $(SOURCES)

### housekeeping
install:
	cp $(EXEC) $(INSTALL_DIR)

clean:
	$(RM) *.o *~

cleanall: clean
	$(RM) $(EXEC)
