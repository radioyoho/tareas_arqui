.data

.text
addi $s0, $zero, 10
addi $s1, $s0, 1
addi $t1, $zero, 1
#a0 = contador
#v0 = n
#a1 = n-1
#a2 = n-1
#guardar los n-1 y n-2 en el stack
fibonacci:
	bne $a0, $zero, uno
	addi $sp, $sp, -8
	j check
uno:
	bne $a0, $t1, general
	addi $v0, $zero, 1
	addi $a2, $zero, 1
	sw $a1, 0($sp)
	sw $a2, 4($sp)
	j check
general: 
	lw $a1, 0($sp)
	lw $a2, 4($sp)
	add $v0, $a1, $a2
	add $a2, $zero, $a1
	add $a1, $zero, $v0
	sw $a1, 0($sp)
	sw $a2, 4($sp)
check:
	addi $a0, $a0, 1
	bne $a0, $s1, fibonacci
	addi $sp, $sp, 8

	
	