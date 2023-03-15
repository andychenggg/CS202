.include "macro_print_str.asm"
.extern min_value 4
.data
min_value: .word 0
.text
print_string("please input the number:")
li $v0,5 #read an integer
syscall
move $s0,$v0 #s0 is the number of integers
sll $a0,$s0,2 #new a heap with 4*$s0
li $v0,9
syscall
move $s1,$v0 #$s1 is the start of the heap
move $s2,$v0 #$s2 is the point