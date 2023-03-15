## "print_callee.asm" ##

.data
.extern default_str 20
default_str: .asciiz "it's the default_str\n¡±
str_callee: .asciiz "it's in print callee."
.text
.extern print_callee
print_callee: addi $sp,$sp,-4
sw $v0,($sp)
addi $v0,$zero,4
la $a0,str_callee
syscall

lb $t0, default_str
addi $t0, $t0, -32
sb $t0, default_str

la $a0,default_str ###which one?
syscall
lw $v0,($sp)
addi $sp,$sp,4
jr $ra