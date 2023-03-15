.data
	str: .asciiz "abcde"
.text
	la $t0, str
	lbu, $a0, 0($t0)
	li $v0, 1
	#syscall
	
	lbu, $a0, 1($t0)
	#syscall
	
	li $t1, 355
	
	sh $t1, ($t0)
	
	lbu, $a0, ($t0)
	syscall
	
	lbu, $a0, 1($t0)
	syscall
	
	li $v0 10
	syscall