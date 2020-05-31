100 REM **LETS DO SPRITES, LESSON 4, PALETTE CYCLE
110 REM
120 REM **** SETUP SCREEN ****
130 SCREEN $80 : REM 320x200@256C
140 X = 160-8 : Y = 100-8
150 REM
160 REM **WE WILL NOW CYCLE THE PALETTE OF A SPRITE
170 REM **SET UP A RAINBOW BOX
180 REM
190 REM **** SPRITE DATA ****
200 DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
210 DATA 1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
220 DATA 1,2,3,3,3,3,3,3,3,3,3,3,3,3,2,1
230 DATA 1,2,3,4,4,4,4,4,4,4,4,4,4,3,2,1
240 DATA 1,2,3,4,5,5,5,5,5,5,5,5,4,3,2,1
250 DATA 1,2,3,4,5,6,6,6,6,6,6,5,4,3,2,1
260 DATA 1,2,3,4,5,6,7,7,7,7,6,5,4,3,2,1
270 DATA 1,2,3,4,5,6,7,8,8,7,6,5,4,3,2,1
280 DATA 1,2,3,4,5,6,7,8,8,7,6,5,4,3,2,1
290 DATA 1,2,3,4,5,6,7,7,7,7,6,5,4,3,2,1
300 DATA 1,2,3,4,5,6,6,6,6,6,6,5,4,3,2,1
310 DATA 1,2,3,4,5,5,5,5,5,5,5,5,4,3,2,1
320 DATA 1,2,3,4,4,4,4,4,4,4,4,4,4,3,2,1
330 DATA 1,2,3,3,3,3,3,3,3,3,3,3,3,3,2,1
340 DATA 1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
350 DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
360 REM
370 REM **** LOAD SPRITE DATA ****
380 FOR J = 0 TO 255
390 READ D
400 VPOKE $0,$C000+J,D
410 NEXT J
420 REM
430 REM **LETS SET THE SPRITES ATTRIBUTES NOW
440 REM
450 REM **** SET SPRITE ATTRIBUTES ****
460 VPOKE $1, $FC00, $00 : REM ADDRESS
470 VPOKE $1, $FC01, $86 : REM MODE, ADDRESS
480 VPOKE $1, $FC02, X : REM X POSITION
490 VPOKE $1, $FC03, $00 : REM X POSITION
500 VPOKE $1, $FC04, Y : REM Y POSITION
510 VPOKE $1, $FC05, $00 : REM Y POSITION
520 VPOKE $1, $FC06, $0C : REM COLLISION MASK, ZDEPTH, VFLIP, HFLIP
530 VPOKE $1, $FC07, $50 : REM HEIGHT, WIDTH, PALETTE OFFSET
540 REM
550 REM **NOW LETS ENABLE SPRITES
560 REM
570 REM **** ENABLE SPRITES ****
580 POKE $9F29, PEEK($9F29) OR $40
590 REM
600 REM **LOOP OVER THE DATA BY CHANGING THE PALETTE (4 BITS = 0-15)
610 REM **CHANGE THE OFFSET BY ONE AND MOVE TO THE NEXT 16 PALETTE COLORS
620 REM
630 FOR J = 0 TO 15
640 VPOKE $1, $FC07, $50 + J
650 REM FOR K = 1 TO 1000 : NEXT K
660 NEXT J
