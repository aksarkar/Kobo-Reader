#!/bin/bash
set -e -u
ARCHIVE=rsync-3.2.2.tar.gz
ARCHIVEDIR=rsync-3.2.2
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	LD=${CROSSTARGET}-ld CC=${CC} CFLAGS="-I${DEVICEROOT}/usr/include/" LIBS="-L${DEVICEROOT}/usr/lib" ./configure --prefix=${DEVICEROOT} --host=${CROSSTARGET} --disable-simd --disable-xxhash --disable-zstd --disable-lz4
	$MAKE -j$MAKE_JOBS
	$MAKE install
popd
markbuilt
