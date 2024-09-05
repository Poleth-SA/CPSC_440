
# Name Poleth CPSC 440
# Simple Assembly program to add 3 + 2
    .data                   # Data section for storing constants and variables
result_msg:     .asciiz "The result is: "   # Message to be printed
    .text                   # The code section
    .globl main             # Entry point of the program

main:
    li $t0, 3               # Load immediate value 3 into register $t0
    li $t1, 2               # Load immediate value 2 into register $t1
    add $t2, $t0, $t1       # Add the values in $t0 and $t1 and store result in $t2

    # Print result
    li $v0, 4               # Load system call code for printing string (4)
    la $a0, result_msg      # Load address of the result message
    syscall                 # Print the result message
    
    # Print result value
    li $v0, 1               # Load system call code for printing integer (1)
    move $a0, $t2           # Move the result from $t2 to argument $a0
    syscall                 # Print the result
    
    # End of program
    li $v0, 10              # Load system call code for exit (10)
    syscall                 # Exit program
