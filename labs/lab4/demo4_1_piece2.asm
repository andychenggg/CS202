.include "macro_print_str.asm"

print_string("please input the array\n")
add $t0,$0,$0
loop_read:
li $v0,5 #read the array
syscall
sw $v0,($s2)
addi $s2,$s2,4
addi $t0,$t0,1
bne $t0,$s0,loop_read
