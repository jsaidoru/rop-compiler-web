org 0xd730
setlr
setsfr
start:
  xr0 = 0xd111, 0xc1, 0x00 # c1 = calculate
  [er0] = r2
  mode_caller
store_b:
  xr0 = var_b, 0x02, 0x00 # init b=2
  [er0] = r2

check_divisibility:
  xr0 = adr_of adr_eq_check_divibility, 0xd16c
  calc_func_verify
  xr0 = adr_of adr_eq_increase_b, var_b
  calc_func
  er2 = 0xd16c
  er0 = [er2],r2 = 9,rt
  er2 = hex 01 00 # divisible
  er0 - er2_eq,r0 = 1,rt
  r1 = 0,rt
  er4 = adr_of has_loop_ended
  er2 = 0x00, adr_arith print_is_prime - adr_arith check_divisibility
  er0*=r2,er2 = er0,er0+=er4,rt
  er14 = er0,pop xr0
  0x30303030
  sp = er14,pop er14

has_loop_ended:
  xr0 = adr_of adr_eq_loop_check, 0xd16c
  calc_func_verify
  setlr
  er2 = 0xd16c
  er0 = [er2],r2 = 9,rt
  er2 = hex 01 00 # 01 = true, 00 = false
  er0 - er2_eq,r0 = 1,rt
  r1 = 0,rt
  er4 = adr_of check_divisibility
  er2 = 0x00, adr_arith print_is_prime - adr_arith check_divisibility
  er0*=r2,er2 = er0,er0+=er4,rt
  er14 = er0,pop xr0
  0x30303030
  sp = er14,pop er14

print_is_prime:
  xr0 = 0x0e, 0x11, adr_of is_prime_text
  smallprint
  render.ddd4
  brk # tạm thời để brk khi nào xong logic thì làm loop
print_is_not_prime:
  xr0 = 0x0e, 0x11, adr_of is_not_prime_text
  smallprint
  render.ddd4
  brk

adr_eq_loop_check:
  adr_of eq_loop_check
adr_eq_check_divibility:
  adr_of eq_check_divisibility
adr_eq_increase_b:
  adr_of eq_increase_b

eq_loop_check:
  hex 43 A8 43 FB02 42 00 # B×B>A
eq_check_divisibility:
  hex 83 42 A9 43 D0 A5 42 A9 43 00 # Int(A÷B)=A÷B
eq_increase_b:
  hex 43 A5 31 00 # B+1
is_prime_text:
  str"~~~~~is~prime~~~~"
is_not_prime_text:
  str"~~~~is~not~prime~~~"