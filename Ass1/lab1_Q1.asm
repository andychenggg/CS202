.data
 	filename: .space 100
	fill: .space 3
 	buffer: .space 400000
 	numberSequence: .space 41
 	mediate: .space 10
 	test: .asciiz "test"
 	endline: .asciiz "\n"
.text
main:

	# read filename
	la $a0, filename
	li $v0, 8
	li $a1, 18
	syscall
	
# open file
	li $v0, 13
	la $a0, filename
	li $a1, 0 # 0 for read
	li $a2, 0
	syscall
	move $s6, $v0 # save file descriptor
	

	
# read file
	li $v0,14
	move $a0, $s6 # load file descriptor
	la $a1, buffer # save read content to buffer space
	li $a2, 40 # reads 40 ascii chars
	syscall
	
	
debug1:	
	
	
	
	
# transform the numbers and store it
	la $s0, buffer
	li $s1, 0 # s1 is the result of the word-number
	la $s2, numberSequence # store to the memory
	li $t1, 0 # t1 is i 
	
iLoop:	beq $t1, 10, exiti
	beq $t1, 5, skip6
	li $t2, 0 # t2 is j 
jLoop: 	beq $t2, 4, exitj
	# transform a char to int
	lbu $t5, ($s0) # t5 represent the actuall number of the char
	# judge 0-9
	blt $t5, 48, notNum
	bgt $t5, 57, notNum
	addi $t5, $t5, -48
	j exitNotNum
notNum:
	# a-f
	addi $t5, $t5, -87
exitNotNum:
debug2:

	
	# calculate
	sll $t6, $s1, 4 # *16
	add $s1, $t6, $t5
	
	# step to next byte
	addi $s0, $s0, 1
	addi $t2, $t2, 1
	j jLoop
exitj:	
	# save to numberSequence
	ush $s1, ($s2)
	# step to next hw
	addi $s2, $s2, 2
	j exitskip6
skip6:
	addi $s0, $s0, 4
exitskip6:	
	addi $t1, $t1, 1
	li $s1, 0 # reset s1
	j iLoop
exiti:


# add the hw-number together
	li $s1, 0 # represent the sum
	la $s2, numberSequence 
	li $t0, 0 
	li $t1, 0 # t1 is i 
i2Loop: beq $t1, 9, exiti2
	ulhu $t0, ($s2)
	add $s1, $s1, $t0
	# step
	addi $s2, $s2, 2
	addi $t1, $t1, 1
	j i2Loop
exiti2:

# wrap around
	la $t2, mediate
	usw $s1, mediate
	ulhu $t0, ($t2)
	ulhu $t1, 2($t2)
	add $s1, $t0, $t1
	

# compute complement
	li $t0, 0x0000ffff
	xor $s1, $s1, $t0
	
# print in hexidecimal
	li $v0, 34
	addi $a0, $s1, 0
	syscall
	
	li $v0, 10
	syscall
	
	






