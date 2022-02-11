
FSRC = $(wildcard *.f90)
FEXEC = $(patsubst %.f90, %, $(FSRC))

CSRC = $(wildcard *.c)
CEXEC = $(patsubst %.c, %, $(CSRC))

CXXSRC = $(wildcard *.cpp)
CXXEXEC = $(patsubst %.cpp, %, $(CXXSRC))

all: $(FEXEC) $(CEXEC) $(CXXEXEC)
fortranfiles: $(FEXEC)
cfiles: $(CEXEC)
cppfiles: $(CXXEXEC)

% : %.c
	$(CC) $(COMPILEROPT) $(INC) -o $@ $^ $(SHLIB)

% : %.cpp
	$(CXX) $(COMPILEROPT) $(INC) -o $@ $^ $(SHLIB)

% : %.f90
	$(FC) $(COMPILEROPT) $(INC) -o $@ $^ $(SHLIB)

.PHONY: clean
clean :
	rm -rf *~ *.o *.exe  *.mod $(FEXEC) $(CEXEC) $(CXXEXEC)

#$(info   SRCS is $(SRCS))
#$(info   PROGS is $(PROGS))
