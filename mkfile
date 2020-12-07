<mkconfig

#HDR = `{ls *.h}
SRC = $SRC $NAME.c
OBJ = ${SRC:%.c=%.o}
TGT = $NAME
all :V: $TGT 
$TGT : $OBJ
	$LD -o $target $LDFLAGS $prereq
%.o :V: %.c
	$CC -c -o $target $CFLAGS $prereq
%.c :QN: $HDR
%.h :QN:
clean :V:
	rm -rf $TGT $OBJ
install :V: $TGT
	cp -f $TGT $EXE/
	chmod 0755 $EXE/$TGT
	cp -f man $MAN/1/$TGT
	chmod 0644 $MAN/1/$TGT
uninstall :V:
	rm -f $EXE/$TGT

