# CS-440
Programming Homework/Project for Computer Architecture Class

## The file provided by professor reads as follow ##


**Computer Architecture CS440**
Programs should be executable on instructor machine.
Submit the program text. Do not submit images of the program.
All programs should have your name commented at the top of the page


**Programming Assignment #1**
*Number in Register*
1. Navigate to http://chortle.ccsu.edu/AssemblyTutorial and complete Chapters 1–4
2. Download and install QTSPIM from http://spimsimulator.sourceforge.net/
3. Write a simple Assembly Language program to add 3 + 2. (be sure to include
comments)
4. Write a simple Assembly Language program to put a Hexadecimal immediate in
Register $8, then OR it with a different immediate value. Place the result in $9


**Programming Assignment #2**
*Add 2 Numbers*
1. Complete the Assembly Language tutorial at
http://chortle.ccsu.edu/AssemblyTutorial/index.html#part1 through Chapter 8
2. Write a simple Assembly Language program to add +146 and -82. Place result
in $10.


**Programming Assignment #3**
*Shift register*
1. Complete the Assembly Language tutorial at
http://chortle.ccsu.edu/AssemblyTutorial/index.html#part1 through Chapter 12.
2. Write a simple Assembly Language program to load any register with 0x1A. Shift
left 2 positions and store result in a different register.


**Programming Assignment #4**
*Average*
1. Complete the Assembly Language tutorial at
http://chortle.ccsu.edu/AssemblyTutorial/index.html#part1 through Chapter 16.
2. Write a simple Assembly Language program that has a data section
declared as follows:
.data
.byte 12
.byte 97
.byte 133
.byte 82
.byte 236
3. Add the values up, compute the average, and store the result in a
memory location.


**Programming Assignment #5**
*ASCII Conversion*
1. Complete the Assembly Language tutorial at
http://chortle.ccsu.edu/AssemblyTutorial/index.html#part1 through Chapter 20.
2. Write a simple Assembly Language program that declares a string in the
data section:
.data
string: .asciiz "ABCDEFG"
and converts the string to all lower-case characters. Do this by adding
0x20 to each character in the string. (See Appendix F to figure out why
this works.)
4. Assume that the data consists only of upper-case alphabetical
characters, with no spaces or punctuation.


**Programming Assignment #6**
*Fahrenheit/Celsius Converter*
1. Write a program that repeatedly asks the user for a scale F or a C (for
"Fahrenheit" or "Celsius") on one line followed by an integer
temperature on the next line. It then converts the given temperature to
the other scale. Use the formulas:
F = (9/5)C + 32
C = (5/9)(F - 32)
2. Exit the loop when the user types "Q/q". Assume that all input is correct.
For example:
Enter Scale : F
Enter Temperature: 32
Celsius Temperature: 0C
Enter Scale : C
Enter Temperature: 100
Fahrenheit Temperature: 212F
Enter Scale : Q
done


**Programming Assignment #7**
*Subroutine*
1. Write a program with a subroutine that takes three arguments, A, X, and
Y. It then computes A*X*Y and returns it.
2. The main method, in a loop, prompts the user for values of A, X and Y
and prints out the result.


**Programming Assignment #8**
*Finale*
You have completed enough of the tutorial. No further Assembly Language
programs are required for this class.
