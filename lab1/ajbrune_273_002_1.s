/* NAME: Aaron Bruner
   COURSE: ECE273
   SECTION: 002
   PURPOSE: This assmebly file takes a character array, converts the characters to decimal values and then sums them
*/
/* begin assembly code */

.globl asum
.type asum,@function
asum:
    pushl %ebp      // Save old base pointer for restore
    movl %esp, %ebp // Make current stack pointer the new base pointer.
    subl $4, %esp // Allocate 4 bytes of memory for the sum.
    movl $0, -4(%ebp) // Initialize the sum to 0.
.L2:
    movl 8(%ebp),%eax   // Move pointer to buffer into EAX.
    cmpb $0,(%eax)      // Dereference EAX and check if it is equal to null. (Strings are null-terminated)
    jne .L4             // If no, then we loop by jumping to L4.
    jmp .L3             // Once we finish the 'for loop' we jump to L3
.L4:
    movl 8(%ebp),%eax    // Move pointer to buffer into EAX.
    movsbl (%eax),%edx   // Dereference EAX and move its value into EDX.
    addl %edx, -4(%ebp)  // Add EDX to the sum.
    incl 8(%ebp)         // Increment the buffer pointer by one. (Effectively "discarding" the current first element thus we are able to iterate through it)
    jmp .L2
.L3:
    movl -4(%ebp), %eax // Return the sum.
    jmp .L1
.L1:
    movl %ebp, %esp // Restore stack pointer to base pointer
    popl %ebp         // Restore base pointer.
    ret

/* end assembly */
/* Do not forget the required blank line here! */