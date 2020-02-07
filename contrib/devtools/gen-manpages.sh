#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

ZENACOIND=${ZENACOIND:-$SRCDIR/zenacoind}
ZENACOINCLI=${ZENACOINCLI:-$SRCDIR/zenacoin-cli}
ZENACOINTX=${ZENACOINTX:-$SRCDIR/zenacoin-tx}
ZENACOINQT=${ZENACOINQT:-$SRCDIR/qt/zenacoin-qt}

[ ! -x $ZENACOIND ] && echo "$ZENACOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
ZNCVER=($($ZENACOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for zenacoind if --version-string is not set,
# but has different outcomes for zenacoin-qt and zenacoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$ZENACOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $ZENACOIND $ZENACOINCLI $ZENACOINTX $ZENACOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${ZNCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${ZNCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
