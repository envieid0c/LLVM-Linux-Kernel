##############################################################################
# Copyright {c} 2012 Mark Charlebois
#               2012 Behan Webster
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files {the "Software"}, to 
# deal in the Software without restriction, including without limitation the 
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
# sell copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in 
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
##############################################################################

# Note: This file must be included after ${TOPDIR}/common.mk

ARCHARMDIR	= ${ARCHDIR}/arm
ARCHARMBINDIR	= ${ARCHARMDIR}/bin
ARCHARMPATCHES	= ${ARCHARMDIR}/patches

KERNEL_PATCHES	+= $(call add_patches,${ARCHARMPATCHES})

MAKE_FLAGS	= ARCH=arm
MAKE_KERNEL	= ${ARCHARMBINDIR}/make-kernel.sh ${LLVMINSTALLDIR} ${EXTRAFLAGS}
HOST		= arm-none-linux-gnueabi
CROSS_COMPILE	= ${HOST}-
CC		= clang-wrap.sh
CPP		= ${CC} -E

CSCC_URL	= https://sourcery.mentor.com/GNUToolchain/package8734/public/arm-none-eabi/arm-2011.03-42-arm-none-eabi-i686-pc-linux-gnu.tar.bz2
CSCC_DIR	= arm-2011.03
#CSCC_URL	= https://sourcery.mentor.com/GNUToolchain/package9740/public/arm-none-eabi/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2
#CSCC_DIR	= arm-2011.09

CSCC_TAR	= ${notdir ${CSCC_URL}}
CSCC_BIN	= ${TOOLCHAIN}/${CSCC_DIR}/bin

# Add path so that ${CROSS_COMPILE}${CC} is resolved
PATH		+= :${CSCC_BIN}:${ARCHARMBINDIR}:

# Get arm cross compiler
${TOPTMPDIR}/${CSCC_TAR}:
	@mkdir -p ${TOPTMPDIR}
	wget -c -P ${TOPTMPDIR} "${CSCC_URL}"

CROSS_GCC=${CSCC_BIN}/${CROSS_COMPILE}-gcc
gcc arm-cc: ${CROSS_GCC}
${CROSS_GCC}: ${TOPTMPDIR}/${CSCC_TAR}
	tar -x -j -C ${TOOLCHAIN} -f $<
	touch $@
