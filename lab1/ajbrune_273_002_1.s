/* NAME: Aaron Bruner
   COURSE: ECE273
   SECTION: 002
   PURPOSE: This assmebly file takes a character array, converts the characters to decimal values and then sums them
*/
/* begin assembly code */

.globl asum
.type asum,@function
asum:
    pushl %ebp      // Initialize EBP as our initial sum value and make it 0
    movl %esp, %ebp
    subl $4, %esp
    movl $0, -4(%ebp)
.L2:
    movl 8(%ebp),%eax   // The section L2 seems like a for loop and L4 seems like a sub function
    cmpb $0,(%eax)      // If the value in the resgisty EAX is equal to 0 then goto L4
    jne .L4
    jmp .L3             // Once we finish the 'for loop' we jump to L3
.L4:
    movl 8(%ebp),%eax    // Convert EAX into an integer format, then add it to our sum variable in the registry EDX
    movsbl (%eax),%edx   // then, we return back to L2.
    addl %edx, -4(%ebp)
    incl 8(%ebp)         // EBP seems like a counter for the for loop in L2
    jmp .L2
.L3:
    movl -4(%ebp), %eax
    jmp .L1
.L1:
    movl %ebp, %esp
    popl %ebp         // Put the sum variable at the top of the stack so that we can return it
    ret

/* end assembly */
/* Do not forget the required blank line here! */
