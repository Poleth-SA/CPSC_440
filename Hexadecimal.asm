# Name: Poleth Salmeron Acosta CPSC 440
#A simple Assembly Language program to put a Hexadecimal immediate in Register $8, then OR it with a different immediate value. Place the result in $9
    .text
    .globl main

main:
    # Load hexadecimal immediate value into register $8
    li $8, 0x0A
    
    # Load a different immediate value into register $10
    li $10, 0x05

    # Perform OR operation between $8 and $10, store the result in $9
    or $9, $8, $10

    # Print the result stored in $9
    li $v0, 1         # syscall code for printing an integer
    move $a0, $9      # load $9 into argument register $a0
    syscall

    # Exit the program
    li $v0, 10
    syscall
