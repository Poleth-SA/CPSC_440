    .data
string: .asciiz "ABCDEFG"

    .text
    .globl main
    
main:
    # Load the address of the string into $a0
    la $a0, string

loop:
    # Load a character from the string into $t0
    lb $t0, 0($a0)
    
    # Check if the character is null terminator (end of string)
    beqz $t0, exit
    
    # Check if the character is uppercase letter
    li $t1, 'A' # Load ASCII value of 'A' into $t1
    li $t2, 'Z' # Load ASCII value of 'Z' into $t2
    blt $t0, $t1, next_char # If the character is less than 'A', move to next character
    bgt $t0, $t2, next_char # If the character is greater than 'Z', move to next character
    
    # Convert uppercase to lowercase by adding 0x20
    addi $t0, $t0, 0x20
    
    # Store the modified character back to the string
    sb $t0, 0($a0)
    
next_char:
    # Move to the next character in the string
    addi $a0, $a0, 1
    
    # Repeat the loop
    j loop

exit:
    # Print the modified string
    li $v0, 4
    la $a0, string
    syscall

    # Exit the program
    li $v0, 10
    syscall
