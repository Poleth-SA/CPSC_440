# Data section
.data
prompt_scale: .asciiz "Enter Scale (F/C): "
prompt_temp: .asciiz "Enter Temperature: "
result_msg: .asciiz "Temperature in "
result_celsius: .asciiz "Celsius: "
result_fahrenheit: .asciiz "Fahrenheit: "
done_msg: .asciiz "Done\n"
invalid_msg: .asciiz "Invalid input. Please enter 'F', 'C', or 'Q' to quit.\n"

# Text section
.text
main:
    # Display prompt for scale
    li $v0, 4               # syscall code for printing string
    la $a0, prompt_scale    # load address of prompt_scale into $a0
    syscall                  # print prompt_scale
    
    # Get scale input
    li $v0, 12              # syscall code for reading a single character
    syscall                 # read character
    move $t0, $v0           # move input to $t0
    
    # Check if input is 'Q' or 'q' to exit
    li $t1, 'Q'             # load 'Q' into $t1
    beq $t0, $t1, exit      # branch to exit if input is 'Q'
    li $t1, 'q'             # load 'q' into $t1
    beq $t0, $t1, exit      # branch to exit if input is 'q'
    
    # Display prompt for temperature
    li $v0, 4               # syscall code for printing string
    la $a0, prompt_temp     # load address of prompt_temp into $a0
    syscall                  # print prompt_temp
    
    # Get temperature input
    li $v0, 5               # syscall code for reading an integer
    syscall                 # read integer
    move $t2, $v0           # move input to $t2
    
    # Convert temperature
    beq $t0, 'F', to_celsius # branch to to_celsius if scale is 'F'
    beq $t0, 'f', to_celsius # branch to to_celsius if scale is 'f'
    beq $t0, 'C', to_fahrenheit # branch to to_fahrenheit if scale is 'C'
    beq $t0, 'c', to_fahrenheit # branch to to_fahrenheit if scale is 'c'
    li $v0, 4               # syscall code for printing string
    la $a0, invalid_msg     # load address of invalid_msg into $a0
    syscall                  # print invalid_msg
    j main                  # jump back to main
    
to_celsius:
    # Convert temperature to Celsius
    li $t3, 5                # load 5 into $t3
    li $t4, 9                # load 9 into $t4
    sub $t5, $t2, 32         # subtract 32 from temperature
    mult $t3, $t5            # multiply 5 and the result
    mflo $t6                 # get low 32 bits of product
    div $t6, $t4             # divide the result by 9
    mflo $t7                 # get quotient
    li $v0, 4                # syscall code for printing string
    la $a0, result_msg       # load address of result_msg into $a0
    syscall                   # print result_msg
    li $v0, 1                # syscall code for printing integer
    move $a0, $t7            # move result to $a0
    syscall                   # print result
    li $v0, 4                # syscall code for printing string
    la $a0, result_celsius   # load address of result_celsius into $a0
    syscall                   # print result_celsius
    j main                   # jump back to main
    
to_fahrenheit:
    # Convert temperature to Fahrenheit
    li $t3, 9                # load 9 into $t3
    li $t4, 5                # load 5 into $t4
    mult $t3, $t2            # multiply 9 and temperature
    mflo $t5                 # get low 32 bits of product
    div $t5, $t4             # divide the result by 5
    mflo $t6                 # get quotient
    addi $t6, $t6, 32        # add 32 to the result
    li $v0, 4                # syscall code for printing string
    la $a0, result_msg       # load address of result_msg into $a0
    syscall                   # print result_msg
    li $v0, 1                # syscall code for printing integer
    move $a0, $t6            # move result to $a0
    syscall                   # print result
    li $v0, 4                # syscall code for printing string
    la $a0, result_fahrenheit # load address of result_fahrenheit into $a0
    syscall                   # print result_fahrenheit
    j main                   # jump back to main
    
exit:
    # Print "Done" message and exit
    li $v0, 4                # syscall code for printing string
    la $a0, done_msg         # load address of done_msg into $a0
    syscall                   # print done_msg
    li $v0, 10               # syscall code for exit
    syscall                   # exit program
