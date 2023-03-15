.data 
	str: .space 8
	strbin: .space 42
	realbin: .space 42
	isP: .asciiz " is a binary palindrome"
	notP: .asciiz " is not a binary palindrome"
	line2: .asciiz "the ASCII code is "
	line3: .asciiz "the binary code is "
	endline: .asciiz "\n" 
.text
	# read a string
	li $v0, 8
	la $a0, str
	la $a1, 7
	syscall
	
	# get the length, store in $s0
	li $s0, 0
	la $s1, str # store the address
	la $s2, strbin # store the address
# transform a char to 8-bit binary code	
trans:
	lbu $t0, ($s1) # t0 is a char of the input
	blt $t0, 32, exitTrans
	bgt $t0, 126, exitTrans
	
	# to binary
	li $t1, 0
Loop:	
	beq $t1, 8, exitLoop
	rem $t2, $t0, 2
	div $t0, $t0, 2
	addi $t2, $t2, 48 # convert to char
	sb $t2, ($s2)
	addi $s2, $s2, 1
	addi $t1, $t1, 1
	j Loop
exitLoop:
	addi $s1, $s1, 1
	addi $s0, $s0, 1
	j trans
exitTrans:
	li $t0, 0
	sb $t0, ($s1)
	
debug1:	

	
	# convert a strbin to realbin
	li $t0, 0
	la $s2, strbin
	la $s3, realbin
	
iLoop:	beq $t0, $s0, exiti
	li $t1, 0
	addi $s2, $s2, 8
jLoop: 	beq $t1, 8, exitj

	addi $s2, $s2, -1
	lbu $t2, ($s2)
	sb $t2, ($s3)
	
	#li $v0, 11
	#lbu $a0, ($s3)
	#syscall
	
	addi $s3, $s3, 1
	addi $t1, $t1, 1
	j jLoop
exitj:
	addi $s2, $s2, 8
	addi $t0, $t0, 1
	j iLoop
exiti:
	
debug2:
	
	
	
	
	mul $s0, $s0, 8 # s0 store bytes of bin
	la $s2, realbin # first byte address
	addi $s3, $s3, -1 # last byte address
	
	li $t0, 0
check: 	
	beq $t0, $s0, success
	lbu $t1, ($s2)
	lbu $t2, ($s3)
	bne $t1, $t2, fail
	addi $s2, $s2, 1
	addi $s3, $s3, -1
	addi $t0, $t0, 1
	j check
success:
	li $v0, 4
	la $a0, str
	syscall
	
	la $a0, isP
	syscall
	
	la $a0, endline
	syscall

	j finish
fail:
	li $v0, 4
	la $a0, str
	syscall
	
	la $a0, notP
	syscall
	
	la $a0, endline
	syscall

finish:

	div $s0, $s0, 8 # store the length of the str
	
	li $v0, 4
	la $a0, line2
	syscall
	
	li $t0, 0
	la $t1, str
as1:	beq $t0, $s0, exitas1
	# print ascii code
	lbu $a0, ($t1)
	li $v0, 1
	syscall
	# increment
	addi $t1, $t1, 1
	addi $t0, $t0, 1
	# judge -
	beq $t0, $s0, exitas1
	# print -
	li $a0, 45
	li $v0, 11
	syscall
	j as1
exitas1:
	li $v0, 4
	la $a0, endline
	syscall
	
	la $a0, line3
	syscall
	
	li $t0, 0
	la $t1, realbin
ibin1:	beq $t0, $s0, exitibin1
	li $t2, 0
jbin1:	beq $t2, 8, exitjbin1
	lbu $a0, ($t1)
	li $v0, 11
	syscall
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	j jbin1
exitjbin1:
	addi $t0, $t0, 1
	beq $t0, $s0, exitibin1
	li $a0, 45
	syscall
	j ibin1
exitibin1:

	li $v0, 10
	syscall
	
	
	
