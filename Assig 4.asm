.data
values:
    .byte 12
    .byte 97
    .byte 133
    .byte 82
    .byte 236

sum: .word 0
average: .word 0

    .text
    .globl main

main:
    # Load address of the data section into $t0
    la $t0, values

    # Initialize sum to 0
    li $t2, 0

    # Initialize counter to 5
    li $t1, 5

loop:
    # Load byte from memory
    lb $t3, 0($t0)
    # Add byte to sum
    add $t2, $t2, $t3
    # Move to next byte
    addi $t0, $t0, 1
    # Decrement counter
    addi $t1, $t1, -1
    # Branch if counter != 0
    bnez $t1, loop

    # Store sum
    sw $t2, sum

    # Load sum
    lw $t4, sum
    # Calculate average
    div $t4, $t4, 5
    mflo $t5          # Move result to $t5
    # Store average
    sw $t5, average

    # Print sum
    li $v0, 1
    move $a0, $t2
    syscall

    # Print average
    li $v0, 1
    move $a0, $t5
    syscall

    # Exit program
    li $v0, 10
    syscall
