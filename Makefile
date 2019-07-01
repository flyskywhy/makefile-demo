#
# Makefile for any applications
#

# Platform specific setups
#PROGRAMEXT = .elf
include Make.params

# Generic Makefile for C/C++ Program needed variables

# The executable file name.
# Can't be the name of some C/C++ source file.
# If not specified, current directory name or `demo.out' will be used.
PROGRAM = mkdemo

# The pre-processor and compiler options.
#MY_CFLAGS = `pkg-config --cflags opencv boost` -I$(SRCROOT)
MY_CFLAGS = -I$(SRCROOT) -I$(SRCROOT)/../cJSON -L$(SRCROOT)
ifdef SYSROOT
	MY_CFLAGS += --sysroot $(SYSROOT)
endif

# Keep `make` still means `make all` by default, e.g. when there is `${MY_LIBS_TO_GEN}:`
my_all: all
ifdef SYSROOT
	cp ${PROGRAM} $(SYSROOT)/usr/bin/
endif

# The linker options.
#MY_LIBS = `pkg-config --libs opencv boost`
MY_LIBS = -lcurl
MY_LIBS += -lcjson
MY_LIBS_TO_GEN = libcjson.a
ifneq ($(MY_LIBS_TO_GEN),)
${MY_LIBS_TO_GEN}:
	COMMAND_PREFIX="${COMMAND_PREFIX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" ./gen-libs.sh

clean_libs: clean
	make clean -C ../cJSON
endif

# Generic Makefile for C/C++ Program from
# github.com/flyskywhy/makefile.git
# forked and modified from
# github.com/librakyle/makefile.git
include ~/tools/makefile/Makefile
