org 0xd730
  setlr 
  setsfr
  di,rt
  buffer_clear
draw:  
  xr0 = hex 37 01 37 40 
  line_draw
  xr0 = hex 87 01 87 40   
  line_draw
  pop xr0 
player:
  0x3759
  0x0F0F
  render_bitmap
  er0 = adr_of bitmap_player
  render.ddd4
setup_key:
  er0 = adr_of key
  getscancode_nodelay
  xr12 = adr_of [-10] table, adr_of [-10] table
  setlr
  call 17CA6
  pop er0
key:
  0x0000
  cmp_ea
  call 1C64A
  sp = er6, pop er8
left_key_func:
  er2 = 0xffff
  er8 = adr_of [4788] player
  [er8]+=er2,pop xr8
  0x30303030
  er14 = adr_of [-2] loop
  sp = er14,pop er14
right_key_func:
  er2 = 0x0001
  er8 = adr_of [4788] player
  [er8]+=er2,pop xr8
  0x30303030
  er14 = adr_of [-2] loop
  sp = er14,pop er14
loop:
  xr0 = 0xd184d630
  BL strcpy
  er14 = 0xd62e
  sp = er14,pop er14
table:
  hex 40 04
  adr_of [-2] key_1_func
  hex 80 08  
  adr_of [-2] key_2_func
  hex 00 00
  adr_of [-2] loop
bitmap_player:
  hex ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff