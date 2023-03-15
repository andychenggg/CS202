.data 
	str:.asciiz "12111622Andy"
.text
main:
	li $v0,4
	la $a0,str
	syscall
	
	li $v0,10
	syscall
