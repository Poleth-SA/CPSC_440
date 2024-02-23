#Assigment 3 Poleth Salmeron Acosta

# Data Section
        .data
        
result: .asciiz "The result is: "   # String to be displayed
        
        .text
        .globl main

# Main Function
main:
        li $t0, 0x1A            # Load immediate value 0x1A into register $t0
        sll $t1, $t0, 2         # Shift left logical by 2 positions and store the result in $t1

        # Display the result
        li $v0, 4               # syscall code for printing a string
        la $a0, result          # load the address of the result string into $a0
        syscall

        li $v0, 1               # syscall code for printing an integer
        move $a0, $t1           # move the result value to $a0
        syscall

        # Exit the program
        li $v0, 10              # syscall code for exit
        syscall
