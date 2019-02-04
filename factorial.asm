# xSpim Demo Program
# 
#   CPE 315
#   fall 2001
#
# By: Dan Stearns
# Date:  
# Modifications: 
#	4/10/03 knico Tabbed code
#	4/10/03 knico Modified to use s registers instead of t registers
#           
#
# declare global so programmer can see actual addresses.

#  Data Area - allocate and initialize variables
.data

prompt:
	.asciiz "Enter the number:\n"
newline:
	.asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	move $t0, $v0
	syscall

	li $t1, 1

	loop:
		beq $t0, $zero, print
		mult $t1, $t0
		mflo $t1

		li $v0, 1
		move $a0, $t1
		syscall

		li $v0, 4
		la $a0, newline
		syscall

		sub $t0, $t0, 1

		j loop

	print:
		li $v0, 1
		move $a0, $t1
		syscall

		li $v0, 4
		la $a0, newline
		syscall



exit:

	# Exit
	ori     $v0, $0, 10
	syscall
