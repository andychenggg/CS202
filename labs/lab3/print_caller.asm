## "print_caller.asm" ##
#.include "print_callee.asm"
.data
str_caller: .asciiz "it's in print caller."
.text
.globl main
main:
jal print_callee
addi $v0,$zero,4
la $a0,str_caller
syscall

la $a0,default_str ###which one?
syscall

li $v0,10
syscall