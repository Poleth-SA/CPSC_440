    .data
    result_str: .asciiz "The result is: "  # String to print before the result

    .text
    .globl main

main:
    # Initialize the values
    li $8, 146       # Load 146 into register $8
    li $9, -82       # Load -82 into register $9

    # Perform the addition
    add $10, $8, $9  # Add the contents of $8 and $9 and store the result in $10

    # Print the result string
    li $v0, 4         # Load the syscall code for printing a string
    la $a0, result_str  # Load the address of the result string into $a0
    syscall           # Perform the syscall to print the string

    # Print the result value
    li $v0, 1         # Load the syscall code for printing an integer
    move $a0, $10     # Move the content of register $10 into $a0
    syscall           # Perform the syscall to print the integer

    # Exit the program
    li $v0, 10       # Load the exit syscall code
    syscall          # Perform the syscall
