/* NAME: Aaron Bruner
   COURSE: ECE273
   SECTION: 002
   PURPOSE: This assembly file does basic arithmetic operations for the driver file
*/
/* begin assembly code */

/*
FUNCTION     dodiff
ARGUMENTS    Three digits that were determined by the C driver file. (digit1, digit2, digit3)
RETURNS      A integer value diff.
PURPOSE      This function returnt he sum of operation 1 plus operation 2 minus operation 3.

             A good way to think about this is as 3 different operations
             diff = (digit1 * digit1) + (digit2 * digit2) - (digit3 * digit3)
             ^--^   ^---------------^   ^--------------^     ^--------------^
             sum       Operation 1         Operation 2          Opeartion 3
             We want to do all of these operations seperately and then sum them up.
*/
.globl dodiff
.type dodiff, @function
dodiff:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    movl $0, diff       #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#
    movl digit1, %eax   #                 This is our first operation                   #
    movl digit1, %ebx   #       We start by clearing the diff variable so we can        #
    mull %ebx           #        directly add to it without using registries            #
    addl %eax, diff     #                            - - -                              #
    movl digit2, %eax   #   This is our second operation. It is a replica of the first  #
    movl digit2, %ebx   #        operation but instead of digit1 we use digit2.         #
    mull %ebx           #                                                               #
    addl %eax, diff     #                            - - -                              #
    movl digit3, %eax   #                   This is our third operation                 #
    movl digit3, %ebx   #       Notice we're not additing it to the 'diff' registery    #
    mull %ebx           #                                                               #
    subl %eax, diff     #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#

    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret


/*
FUNCTION     dosumprod
ARGUMENTS    Three integer digits (digit1, digit2, digit3)
RETURNS      The sum of digit1 plus digit2 plus digit 3 and the product of digit1, digit2, and digit3
PURPOSE      The purpose of this function is to calculate the sum of three integers
             along with the product those those same three integers
*/
.globl dosumprod
.type dosumprod, @function
dosumprod:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    movl digit1, %eax   #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#
    addl digit2, %eax   #    This is the first sum operation. All we need to do     #
    addl digit3, %eax   #      is keep adding variables to the A registery          #
    movl %eax, sum      #                         - - -                             #
    movl digit1, %eax   #  This is the product operation. All we do is keep using   #
    mull digit2         #  the mull instruction on registery A and then move the    #
    mull digit3         # final number into product so we can use it in the driver  #
    movl %eax, product  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#

    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

/*
FUNCTION    doremainder
ARGUMENTS   Two integer values from the dosumprod function and dodiff function
RETURNS     Returns the remainder from the modulus operation of product and sum
PURPOSE     The purpose of this function is to determine the modulus value of the two values product and sum
            and then return that value in remainder.
*/
.globl doremainder
.type doremainder, @function
doremainder:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp
                            #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#
    movl $0, %edx           # This is a pretty straightforward operation; we clear the d registery because we're dividing.  #
    movl product, %eax      #    We're going to divide the product by the sum and returns the remainder. The remainder is   #
    divl sum                # The remainder is stored in the $edx registery by the divl operation. We simply just grab it   #
    movl %edx, remainder    #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#

    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

/* declare variabels here */

.comm digit1, 4
.comm digit2, 4
.comm digit3, 4
.comm diff, 4
.comm sum, 4
.comm product, 4
.comm remainder, 4

/* end assembly stub */
/* Do not forget the requried blank line here! */