.globl find_min

find_min:
move $v0,$a0
blt $a0,$a1,not_update
move $v0,$a1
not_update:
jr $ra