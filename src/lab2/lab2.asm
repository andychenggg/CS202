.data
	s1: .ascii "Welcome "
	sid: .space 9
	e1: .asciiz " to Mips world"
.text
main:
	li $v0, 8
	la $a0, sid
	li $a1, 9
	syscall
	
	
	la $t1, s1 # 将s1的地址放在t1中
	lb $t2, 7($t1) #将空格放在t2中
	la $t3, sid
	sb $t2, 8($t3)
	
	la $t4, e1
	lw $s5, 1($t4)
	sw $s5, ($s4)
	lw $s5, 5($t4)
	sw $s5, 4($s4)
	lw $s5, 9($t4)
	sw $s5, 8($s4)
	lh $s5, 13($t4)
	sh $s5, 12($s4)
	 
	#lw $t1, sid
	
	#sw $t1, 8($sid)
	
	li $v0, 4
	la $a0, s1
	syscall
	
	#li $v0, 4
	#la $a0, e1
	#syscall
	
	
	
	
	li $v0, 10
	syscall
