/* NAME: Aaron Bruner
   COURSE: ECE273
   SECTION: 002
   PURPOSE: This assmebly file takes a character array, converts the characters to decimal values and then sums them
*/
/* begin assembly code */

.globl asum // Tells the compiler that asum is a global lable.
.type asum,@function // Defines our function
asum:
    pushl %ebp // Subtract 4 bytes from the stack pointer then write the argument to the new address
    movl %esp, %ebp // Put whatever value is in registery %esp into registery %ebp
    subl $4, %esp // Subtract 4 from ESP
    movl $0, -4(%ebp) // Put 0 into the memory location EBP-4 (we allocated this in the pushl instruction)
.L2:
    movl 8(%ebp),%eax // Move EBP+8 into the address EAX
    cmpb $0,(%eax) // If the value in the resgisty EAX is equal to 0 then goto L4
    jne .L4
    jmp .L3 // Jump to L3
.L4:
    movl 8(%ebp),%eax // Move EBP+8 into the address EAX
    movsbl (%eax),%edx // movsbl will expand EAX into a 32-bit signed integer and move it into registery EDX
    addl %edx, -4(%ebp) // We're going to take the value of EDX and EBP-4 and add them together
    incl 8(%ebp) // Increase EBP+8 by 1
    jmp .L2 // Jump to L2
.L3:
    movl -4(%ebp), %eax
    jmp .L1
.L1:
    movl %ebp, %esp
    popl %ebp
    ret

/* end assembly */
/* Do not forget the required blank line here! */
