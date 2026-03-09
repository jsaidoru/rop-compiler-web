org 0xd730
setlr
setsfr
di,rt
buffer_clear

pop xr0
pointer:
  0xe3e0
  0x61
  0x00
  [er0] = r2
spell:
  xr0 = 0x0a, 0x0a, 0xe3e0
  smallprint
  render.ddd4
setup_key:
  er0 = adr_of key
  getscancode
  ea = adr_of table
  pop er0
key:
  0x0000
  cmp_ea
  call 1c64a
  sp = er6,pop er8
key_left_func:
  er2 = 0xffff
  goto set_pointer_addr
key_right_func:
  er2 = 0x0001
  goto set_pointer_addr
key_up_func:
  er2 = 0x0001
  goto set_pointer_value
key_down_func:
  er2 = 0xffff
set_pointer_value:
  er8 = adr_of [4786] pointer
  [er8] += er2,pop xr8
  0x30303030
  goto copy
set_pointer_addr:
  er8 = adr_of [4784] pointer
  [er8] += er2,pop xr8
  0x30303030
copy:
  qr0 = 0x2000, 0xe3e0, 0xe4e0, 0x3030
  call 18932 # BL memcpy
  0x3030
check_encode_length:
  er2 = 0x2000
  setlr
  er0 - er2_gt,r0 = 0 |r0 = 1,rt
  r1 = 0,rt
  er2 = adr_of jump_table
  er0+=er0,er2+=er0,er0=[er2]
  er14 = er0,pop xr0
  0x30303030
  sp = er14, pop er14
encode:
  er0 = 0x0100
  er2 = 0x0700
  er8 = 0xe4e0
  [er8] += er2,pop xr8
  0x30303030
  er0 += 1,rt
  goto check_encode_length
loop:
  qr0 = 0xd630, 0xd184, 0x3030, 0xd62e
  BL strcpy
  sp = er6,pop er8
table:
  hex 40 04
  adr_of [-2] key_left_func
  hex 80 08
  adr_of [-2] key_right_func
  hex 80 04
  adr_of [-2] key_up_func
  hex 40 08
  adr_of [-2] key_down_func
  hex 00 00
  adr_of [-2] loop
jump_table:
  adr_of [-2] encode
  adr_of [-2] check_encode_length