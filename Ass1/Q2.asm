.data
	str: .space 10
	endline: .asciiz "\n"
.text
main:
# read a string
	la $a0, str
	li $a1, 10
	li $v0, 8
	syscall
	
# check parity
	li $t0, 0 # cnt of read bits
	li $t1, 0 # cnt of 1s
	la $s0, str # address of str
check:
	lbu $t2, ($s0)
	beq $t2, 48, skip2
	beq $t2, 49, skip1
	j exit
skip1:
	addi $t1, $t1, 1
skip2:	
	addi $t0, $t0, 1
	addi $s0, $s0, 1
	j check
exit:

	beq $t0, 7, _7bits
	# 8 bits
	rem $t2, $t1, 2
	beq $t2, 1, remain1
	li $a0, 1
	j finish
remain1:
	li $a0, 0
	j finish
_7bits:
	# 7 bits
	rem $t2, $t1, 2
	beq $t2, 1, remain1_
	li $a0, 0
	j finish
remain1_:
	li $a0, 1
	j finish
finish:
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	