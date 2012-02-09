##############################################################################
# Copyright (c) 2012 Mark Charlebois
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to 
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

# Note: This file must be included after ${TOPDIR}/makefiles/common.mk

PATCH_FILES+=${COMMON}/arm/common-arm.patch ${COMMON}/arm/fix-warnings-arm.patch \
	${COMMON}/arm/fix-warnings-arm-unused.patch
MAKE_FLAGS=ARCH=arm
MAKE_KERNEL=${COMMON}/arm/bin/make-kernel.sh ${LLVMINSTALLDIR}
MAKE_DEVKERNEL=${COMMON}/arm/bin/make-kernel.sh ${LLVMDEVINSTALLDIR}
HOST=arm-none-linux-gnueabi
CROSS_COMPILE=arm-none-linux-gnueabi-
CC=clang-wrap.sh
CPP=${CC} -E

# Add path so that ${CROSS_COMPILE}${CC} is resolved
PATH+=:/opt/arm-2011.03/bin:${COMMON}/arm/bin
