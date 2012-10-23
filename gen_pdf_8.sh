EXEC=./k2pdfopt32
FILE=$1

$EXEC -ui- -w 768 -h 1024 -odpi 160 -o %s_8 -x $FILE
