org 0xDA78
home:
	adr_of key
	er14 = adr_of [-12] cvt
	getkey
	hex 00 00 00 00
key:
	hex 00 00 00 00 00 00 00 00
cvt:
	xr0 = adr_of key, 0x5C9E
	setlr
	di,rt
	buffer_clear.ca54
	cvt_key
	hex 00 00 00 00
cmpkey:
	er8 = er0
	er2 = hex 2F 00
	er0 - er2_gt,r0 = 0,pop er4
	adr_of [-2] cmpkey2
mul1:
	er2 = adr_arith cmpkeyshift - adr_arith cmpkey2, 0x00
	er0*=r2,er2 = er0,er0+=er4,rt
	er14 = er0,pop xr0
	hex 00 00 00 00
	er0 = er8
	sp = er14,pop er14
cmpkey2:
	er8 = er0
	er2=er0,er0+=er4,rt
	er0 = hex 3A 00
	er0 - er2_gt,r0 = 0,pop er4
	adr_of [-2] check
mul2:
	er2 = adr_arith cmpkeyshift - adr_arith check, 0x00
	er0*=r2,er2 = er0,er0+=er4,rt
	er14 = er0,pop xr0
	hex 00 00 00 00
	er0 = er8
	sp = er14,pop er14
check:
	R0 & 0F,rt
	er2=er0,er0=er2
	er4 = adr_of [+1006] modifier
	er0 = [er4],er0+=1,[er4] = er0,pop er0,rt
	adr_of [+1006] idk
	pop er8
modeshift:
	0x0000
	er2+=er8,rt
	pop er8
modifier:
	0x0000
	er0+=er8,rt
	[er0] = r2,r0=0
	xr0 = adr_of [+1006] modeshift, 0x0000
	[er0]=er2,rt
	er0 = er8
	er2 = hex 00 00
	er0 - er2_gt,r0 = 0,pop er4
	adr_of [-2] cvthex
mul3:
	er2 = adr_arith jump - adr_arith cvthex, 0x00
	er0*=r2,er2 = er0,er0+=er4,rt
	er14 = er0,pop xr0
	hex 00 00 00 00
	sp = er14,pop er14
cvthex:
	pop xr0 
	adr_of [+1006] modifier
	0x0000
	[er0]=er2,rt
	pop xr0
	0x0000
	adr_of [+1006] idk
	er0 = [er2],r2 = 9,rt
	pop er2
addr:
	0xE300
	setlr
	r0 << 4
	r0 | r1
	[er2] = r0,r0=0
	goto keyright
jump:
	goto set_segment
cmpkeyshift:
	er2=er0,er0=er2
	er0 = adr_arith cmpkeyac - adr_arith keyshift, 0x00
	er4 = hex 29 FC
	er14 = adr_of [-2] womp
	er2 - er4_beq,r0 = 0,pop er12,pop xr4,pop xr8,sp = er14,pop er14
	0x0000	#er12
	adr_of [-82] keyshift	#er4
	0x0000	#er6
	0x0000	#er8
	0x0000	#er10
womp:
	setlr
	er4+=er0,r8=r8,rt
	er0=er2
	sp = er4,sp += 46, pop xr4, pop qr8
keyshift:
	er2 = adr_of [+1006] modeshift
	er0 = [er2],r2 = 9,rt
	er2 = hex 08 00
	er0 - er2_gt,r0 = 0,pop er4
	0x0000
	er2 = hex 09 00
	er0*=r2,er2 = er0,er0+=er4,rt
	er2 = adr_of [+1006] modeshift
	[er2] = r0,r0=0
	er6 = adr_of [-2] set_segment
	sp = er6,pop er8
cmpkeyac:
	er2=er0,er0=er2
	er0 = adr_arith cmpkeyhome - adr_arith keyac, 0x00
	er4 = hex 26 FC
	er14 = adr_of [-2] womp2
	er2 - er4_beq,r0 = 0,pop er12,pop xr4,pop xr8,sp = er14,pop er14
	0x0000	#er12
	adr_of [-82] keyac	#er4
	0x0000	#er6
	0x0000	#er8
	0x0000	#er10
womp2:
	setlr
	er4+=er0,r8=r8,rt
	er0=er2
	sp = er4,sp += 46, pop xr4, pop qr8
keyac:
	er2 = adr_of [+1006] addr
	er0 = [er2],r2 = 9,rt
	er14 = er0,pop xr0
	0x00000000
	sp=er14,pop er14
cmpkeyhome:
	er2=er0,er0=er2
	er0 = adr_arith cmpkey4 - adr_arith keyhome, 0x00
	er4 = hex 24 FC
	er14 = adr_of [-2] womp3
	er2 - er4_beq,r0 = 0,pop er12,pop xr4,pop xr8,sp = er14,pop er14
	0x0000	#er12
	adr_of [-82] keyhome	#er4
	0x0000	#er6
	0x0000	#er8
	0x0000	#er10
womp3:
	setlr
	er4+=er0,r8=r8,rt
	er0=er2
	sp = er4,sp += 46, pop xr4, pop qr8
keyhome:
	er0 = adr_of [+1007] addr
	er2 = adr_of [+1007] addr
	[er0]=er2,rt
	goto set_segment
cmpkey4:
	er8 = er0
	er2 = hex 1B FC
	er0 - er2_gt,r0 = 0,pop er4
	adr_of [-2] cmpkey5
mul4:
	er2 = adr_arith other_key - adr_arith cmpkey5, 0x00
	er0*=r2,er2 = er0,er0+=er4,rt
	er14 = er0,pop xr0
	hex 00 00 00 00
	er0 = er8
	sp = er14,pop er14
cmpkey5:
	er8 = er0
	er2=er0,er0+=er4,rt
	er0 = hex 20 FC
	er0 - er2_gt,r0 = 0,pop er4
	adr_of [-2] cmpkey6
mul5:
	er2 = adr_arith other_key - adr_arith cmpkey6, 0x00
	er0*=r2,er2 = er0,er0+=er4,rt
	er14 = er0,pop xr0
	hex 00 00 00 00
	er0 = er8
	sp = er14,pop er14
cmpkey6:
	er2 = hex E4 03
	er0+=er2,rt
mul6:
	er4 = adr_of [-2] keyup
	er2 = adr_arith keyleft - adr_arith keyright, 0x00
	er0*=r2,er2 = er0,er0+=er4,rt
	er14 = er0,pop xr0
	hex 00 00 00 00
	sp = er14,pop er14
other_key:
	er6 = adr_of [+6] set_segment
	sp = er6,pop er8
keyup:
	xr0 = adr_of [+1006] modifier, 0x0000
	[er0]=er2,rt
	er14 = adr_of [-12] cvttostring
	er10 = adr_of [+994] addr
	er0 = hex 50 00
	[er10+c] += er0,sp=er14,pop xr4,pop qr8
keydown:
	xr0 = adr_of [+1006] modifier, 0x0000
	[er0]=er2,rt
	er14 = adr_of [-12] cvttostring
	er10 = adr_of [+994] addr
	er0 = hex b0 ff
	[er10+c] += er0,sp=er14,pop xr4,pop qr8
keyright:
	xr0 = adr_of [+1006] modifier, 0x0000
	[er0]=er2,rt
	er14 = adr_of [-12] cvttostring
	er10 = adr_of [+994] addr
	er0 = hex 01 00
	[er10+c] += er0,sp=er14,pop xr4,pop qr8
keyleft:
	xr0 = adr_of [+1006] modifier, 0x0000
	[er0]=er2,rt
	er14 = adr_of [-12] cvttostring
	er10 = adr_of [+994] addr
	er0 = hex ff ff
	[er10+c] += er0,sp=er14,pop xr4,pop qr8
cvttostring:
	setlr
	er8 = adr_of [+1007] addr
	er10 = adr_of [-2] address
	hex_byte,pop xr8
	adr_of [+1006] addr
	adr_of address
	hex_byte,pop xr8
	0x0000
	adr_of byte
	er0 = adr_of [+1006] addr
	setlr
	er8 = [er0],rt
	hex_byte,pop xr8
	0x00000000
spell:
	xr0 = 0x11, 0x30, adr_of [-8] address
	print_line
	xr0 = 0x21, 0x30, adr_of [-9] byte
	print_line
	BL render.ca54
set_segment:
	xr8 = 0x0500, 0x0020
	er0 = er8
	delay
	di,rt
	er10 = adr_of length
	er0 = 0x0001
	[er10] = er0,r0 = 0,pop er10
	0x0000
loop:
	qr0 = adr_of home, 0xde66, pr_length, adr_of home
	hex e6 4d
length:
	hex 08 00 00 00
	sp = er6,pop er8
idk:
	0x0000
	hex 20 20 41 64 64 72 3A 20
address:
	hex 20 20 20 20 20 20 20 20 20
	hex 20 20 56 61 6C 75 65 3A 20
byte:
	hex 20 20 20 20 20 20 20 20