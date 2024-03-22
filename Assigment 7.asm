# Variable declaration
.data
promptA: .asciiz "Enter the value of A: "
promptX: .asciiz "Enter the value of X: "
promptY: .asciiz "Enter the value of Y: "
Result: .asciiz "Value of A*X*Y = "
newline: .asciiz "\n"
numA: .space 100    # Buffer to store input string for A
numX: .space 100    # Buffer to store input string for X
numY: .space 100    # Buffer to store input string for Y

# Main program
.text
main:
    # Loop for continuous input
    loop:
        # Prompt the user for A value
        li $v0, 4
        la $a0, promptA
        syscall

        # Read the user input for A
        li $v0, 8
        la $a0, numA
        li $a1, 100
        syscall

        # Prompt the user for X value
        li $v0, 4
        la $a0, promptX
        syscall

        # Read the user input for X
        li $v0, 8
        la $a0, numX
        li $a1, 100
        syscall

        # Prompt the user for Y value
        li $v0, 4
        la $a0, promptY
        syscall

        # Read the user input for Y
        li $v0, 8
        la $a0, numY
        li $a1, 100
        syscall

        # Convert strings to integers
        li $t0, 0           # Initialize temporary register to hold integer value of A
        li $t1, 0           # Initialize temporary register to hold integer value of X
        li $t2, 0           # Initialize temporary register to hold integer value of Y

        # Convert string A to integer
        li $t3, 0           # Initialize index for parsing
    parse_loop_A:
        lb $t4, numA($t3)  # Load a character from the string
        beq $t4, $zero, parse_done_A  # If null terminator is reached, exit loop
        sub $t4, $t4, 48    # Convert ASCII digit to integer
        mul $t0, $t0, 10    # Multiply current integer value by 10
        add $t0, $t0, $t4   # Add the current digit to the integer value
        addi $t3, $t3, 1    # Move to next character
        j parse_loop_A
    parse_done_A:

        # Convert string X to integer
        li $t3, 0           # Reset index for parsing
    parse_loop_X:
        lb $t4, numX($t3)  # Load a character from the string
        beq $t4, $zero, parse_done_X  # If null terminator is reached, exit loop
        sub $t4, $t4, 48    # Convert ASCII digit to integer
        mul $t1, $t1, 10    # Multiply current integer value by 10
        add $t1, $t1, $t4   # Add the current digit to the integer value
        addi $t3, $t3, 1    # Move to next character
        j parse_loop_X
    parse_done_X:

        # Convert string Y to integer
        li $t3, 0           # Reset index for parsing
    parse_loop_Y:
        lb $t4, numY($t3)  # Load a character from the string
        beq $t4, $zero, parse_done_Y  # If null terminator is reached, exit loop
        sub $t4, $t4, 48    # Convert ASCII digit to integer
        mul $t2, $t2, 10    # Multiply current integer value by 10
        add $t2, $t2, $t4   # Add the current digit to the integer value
        addi $t3, $t3, 1    # Move to next character
        j parse_loop_Y
    parse_done_Y:

        # Call multiplication subroutine
        move $a0, $t0       # Move integer value of A to $a0
        move $a1, $t1       # Move integer value of X to $a1
        move $a2, $t2       # Move integer value of Y to $a2
        jal mul_sub

        # Print result
        li $v0, 4           # System call code for printing string
        la $a0, Result      # Load the address of result string
        syscall

        # Print the calculated result
        li $v0, 1           # System call code for printing integer
        move $a0, $v0       # Move the result to be printed into $a0
        syscall

        # Print newline
        li $v0, 4           # System call code for printing string
        la $a0, newline     # Load the address of newline string
        syscall

        # End loop
        j loop

# Subroutine definition
mul_sub:
    # Multiply A and X, store result in HI and LO
    mult $a0, $a1
    mflo $t0             # Store the result in a temporary register

    # Multiply the result with Y and store the result in HI and LO
    mult $t0, $a2
    mflo $v0             # Store the final result in $v0

    jr $ra               # Return from subroutine
