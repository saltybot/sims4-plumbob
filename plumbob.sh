#!/bin/sh

COMMAND=( "\x00" "\x07" "\x00" "\xFF" "\x00" "\xFF" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" "\x00" )

COLORS=( "\x00" "\x05" "\x0A" "\x0F" "\x14" "\x19" "\x1E" "\x23" "\x28" "\x2D" "\x32" "\x37" "\x3C" "\x41" "\x46" "\x4B" "\x50" "\x55" "\x5A" "\x5F" "\x64" "\x69" "\x6E" "\x73" "\x78" "\x7D" "\x82" "\x87" "\x8C" "\x91" "\x96" "\x9B" "\xA0" "\xA5" "\xAA" "\xAF" "\xB4" "\xB9" "\xBE" "\xC3" "\xC8" "\xCD" "\xD2" "\xD7" "\xDC" "\xE1" "\xE6" "\xEB" "\xF0" "\xF5" "\xFA" "\xFF" )

BEGIN=51
END=0
STEP=-1

for (( ; ; ))
do
    for i in 3 4 5 3 4 5
    do
        for c in `seq $BEGIN $STEP $END`
        do
	    COMMAND[$i]=${COLORS[$c]}
            #echo ${COMMAND[@]} | tr -d " "
            echo -e ${COMMAND[@]} | tr -d " " > /dev/hidraw0
            #sleep 0.1
        done
        TEMP=$BEGIN
        BEGIN=$END
        END=$TEMP
        let STEP=-$STEP
    done
done
