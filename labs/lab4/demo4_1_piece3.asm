.include "macro_print_str.asm"
lw $t0,($s1) #initialize the min_value
sw $t0,min_value
li $t0,1
addi $s2,$s1,4 #$s1 is the start of the heap
loop_find_min:
beq $t0,$s0, exit
lw $a0,min_value
lw $a1,($s2)
jal find_min
sw $v0,min_value
addi $s2,$s2,4 #$s2 is the point
addi $t0,$t0,1
# bne $t0,$s0 loop_find_min #s0 is the number of integers
exit:
print_string("the min value : ")
li $v0,1
lw $a0,min_value
syscall
end #end is defined in the file is macro_print_str.asm