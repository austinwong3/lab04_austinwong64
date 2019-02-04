# xSpim MedianNumbers.asm program
# 
#

#  Data Area - allocate and initialize variables
.data

	# TODO: Complete these declarations / initializations

	prompt: .asciiz "Enter the next number:\n"

	answer: .asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	li $v0, 4
	la $a0, prompt
	syscall

	li	$v0, 5	
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li	$v0, 5	
	syscall
	move $t1, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li	$v0, 5	
	syscall
	move $t2, $v0

compareLess:
	blt $t0, $t1, compareMore
	j compareLessF

compareMore:
	blt $t1, $t2, finish
	j rearrange

compareLessF:
	blt $t2, $t1, finish
	j rearrange

rearrange:
	move $t2, $t3
	move $t1, $t2
	move $t0, $t1
	move $t3, $t0
	j compareLess


finish:
	li $v0, 4
	la $a0, answer
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

exit:

	# Exit
	ori     $v0, $0, 10
	syscall

