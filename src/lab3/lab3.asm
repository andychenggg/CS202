.data
	nextline: .asciiz "\n"
	sp: .asciiz " "
	multi: .asciiz "*"
	eq: .asciiz "="
	
.text
j afterMethod
print:
	#addi $t0, $a0, 0
	#addi $t1, $a1, 0
	#mul $t2, $t0, $t1
	#addi $t0, $t0, 48
	#addi $t1, $t1, 48
	#la $t0, 3($t0)
	#la $t1, 3($t1)
	#sb $t0, $t3
	#lb $t0, multi 
	#sb $t0, 1($t3)
	#sb $t1, 2($t3)
	#lb $t1, eq 
	#sb $t1, 3($t3)
	#lb $t1, null_ 
	#sb $t1, 4($t3)
	#li $v0, 4
	#la $a0, $t3
	#syscall
	#jr $ra	
	mul $t0, $a0, $a1
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, multi
	syscall
	li $v0, 1
	addi $a0, $a1, 0
	syscall
	li $v0, 4
	la $a0, eq
	syscall
	li $v0, 1
	lw $a0, ($t0)
	#addi $a0, $t0, 0
	syscall
	li $v0, 4
	la $a0, sp
	syscall
	jr $ra
afterMethod:

	li $s0, 0
	li $s1, 0
	li $s2, 9
iloop:
	addi $s0, $s0, 1
jloop:	
	addi $s1, $s1, 1
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal print
	beq $s1, $s0, exitj
	j jloop
exitj:	
	li, $s1, 0
	li, $v0, 4
	la $a0, nextline
	syscall
	beq $s0, $s2, exiti
	j iloop

exiti:
	li $v0 10
	syscall
